#define TILE_WIDTH 512

// Commonly used, intuitive but uncoalesced
__global__ void rgb_copy_array_interleaved(int *pixel_dst, int *pixel_src)
{
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  int disrupt = tid;
  pixel_dst[3 * tid + 0] = pixel_src[3 * tid + 0]; // r
  pixel_dst[3 * tid + 1] = pixel_src[3 * tid + 1]; // g
  pixel_dst[3 * tid + 2] = pixel_src[3 * tid + 2]; // b
  if (disrupt > 10)
    disrupt = disrupt * 2;
};

// Desired, coalesced
__global__ void rgb_copy_array_coalesced(int *pixel_dst, int *pixel_src)
{
  // IMPORTANT: BUGGY CODE FIX
  int tid = 3 * blockIdx.x * blockDim.x + threadIdx.x;
  pixel_dst[tid + 0 * blockDim.x] = pixel_src[tid + 0 * blockDim.x]; // r/g/b stride 1
  pixel_dst[tid + 1 * blockDim.x] = pixel_src[tid + 1 * blockDim.x]; // r/g/b stride 2
  pixel_dst[tid + 2 * blockDim.x] = pixel_src[tid + 2 * blockDim.x]; // r/g/b stride 3
};

// Commonly used, intuitive but uncoalesced
// Functionality: averaging, new_r/g/b = 0.5 * curr_r/g/b + 0.5 * right_r/g/b
// Assumption: the total number of pixels minus one is a multiple of our TILE_WIDTH and aka blockDim.x
// Pattern: load data into shared memory, compute/read/write only on shared memory, write result in shared memory to global memory
__global__ void rgb_smem_array_interleaved(int *pixel_dst, int *pixel_src, int size)
{

  /*
    Declaration
  */
  int global_tid = blockIdx.x * blockDim.x + threadIdx.x;
  int local_tid = threadIdx.x;
  __shared__ int pixel_smem_src[3 * TILE_WIDTH + 3];
  __shared__ int pixel_smem_dst[3 * TILE_WIDTH];

  /*
    Read input pixels to shared memory
    TODO: uncoalesced, with slightly complicated pattern but still a continuous region of memory
  */
  pixel_smem_src[3 * local_tid + 0] = pixel_src[3 * global_tid + 0]; // r
  pixel_smem_src[3 * local_tid + 1] = pixel_src[3 * global_tid + 1]; // g
  pixel_smem_src[3 * local_tid + 2] = pixel_src[3 * global_tid + 2]; // b
  if (local_tid < 3)                                                 // In this assumption, we always want to load tail
  {
    pixel_smem_src[3 * TILE_WIDTH + local_tid] = pixel_src[3 * TILE_WIDTH + local_tid];
  }

  /*
    Computation
  */
  pixel_smem_dst[3 * local_tid + 0] = (pixel_smem_src[3 * local_tid + 0] + pixel_smem_src[3 * (local_tid + 1) + 0]) >> 1;
  pixel_smem_dst[3 * local_tid + 1] = (pixel_smem_src[3 * local_tid + 1] + pixel_smem_src[3 * (local_tid + 1) + 1]) >> 1;
  pixel_smem_dst[3 * local_tid + 2] = (pixel_smem_src[3 * local_tid + 2] + pixel_smem_src[3 * (local_tid + 1) + 2]) >> 1;

  /*
    Write result to destination
    TODO: uncoalesced
  */
  __syncthreads();
  pixel_dst[3 * global_tid + 0] = pixel_smem_dst[3 * local_tid + 0]; // r
  __syncthreads();
  pixel_dst[3 * global_tid + 1] = pixel_smem_dst[3 * local_tid + 1]; // g
  __syncthreads();
  pixel_dst[3 * global_tid + 2] = pixel_smem_dst[3 * local_tid + 2]; // b
};

__global__ void rgb_increase_brightness(int *pixel_dst, int *pixel_src,
                                        int size, float factor) {
  /*
    Declaration
  */
  int global_tid = blockIdx.x * blockDim.x + threadIdx.x;
  int local_tid = threadIdx.x;
  __shared__ int pixel_smem_src[3 * TILE_WIDTH];
  __shared__ int pixel_smem_dst[3 * TILE_WIDTH];

  /*
    Read input pixels to shared memory
  */
  pixel_smem_src[3 * local_tid + 0] = pixel_src[3 * global_tid + 0];  // r
  __syncthreads();
  pixel_smem_src[3 * local_tid + 1] = pixel_src[3 * global_tid + 1];  // g
  __syncthreads();
  pixel_smem_src[3 * local_tid + 2] = pixel_src[3 * global_tid + 2];  // b
  __syncthreads();

  /*
    Computation
  */
  pixel_smem_dst[3 * local_tid + 0] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 0])));
  pixel_smem_dst[3 * local_tid + 1] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 1])));
  pixel_smem_dst[3 * local_tid + 2] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 2])));
  __syncthreads();

  /*
    Write result to destination
  */
  pixel_dst[3 * global_tid + 0] = pixel_smem_dst[3 * local_tid + 0];  // r
  __syncthreads();
  pixel_dst[3 * global_tid + 1] = pixel_smem_dst[3 * local_tid + 1];  // g
  __syncthreads();
  pixel_dst[3 * global_tid + 2] = pixel_smem_dst[3 * local_tid + 2];  // b
};

__global__ void rgb_increase_brightness_coalesced(int *pixel_dst,
                                                  int *pixel_src, int size,
                                                  float factor) {
  /*
    Declaration
  */
  int global_tid = 3 * blockIdx.x * blockDim.x + threadIdx.x;
  int local_tid = threadIdx.x;
  __shared__ int pixel_smem_src[3 * TILE_WIDTH];
  __shared__ int pixel_smem_dst[3 * TILE_WIDTH];

  /*
    Read input pixels to shared memory
  */
  pixel_smem_src[local_tid + 0 * blockDim.x] =
      pixel_src[global_tid + 0 * blockDim.x];  // r
  __syncthreads();
  pixel_smem_src[local_tid + 1 * blockDim.x] =
      pixel_src[global_tid + 1 * blockDim.x];  // g
  __syncthreads();
  pixel_smem_src[local_tid + 2 * blockDim.x] =
      pixel_src[global_tid + 2 * blockDim.x];  // b
  __syncthreads();

  /*
    Computation
  */
  pixel_smem_dst[3 * local_tid + 0] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 0])));
  pixel_smem_dst[3 * local_tid + 1] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 1])));
  pixel_smem_dst[3 * local_tid + 2] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 2])));
  __syncthreads();

  /*
    Write result to destination
  */
  pixel_dst[global_tid + 0 * blockDim.x] =
      pixel_smem_dst[local_tid + 0 * blockDim.x];  // r
  __syncthreads();
  pixel_dst[global_tid + 1 * blockDim.x] =
      pixel_smem_dst[local_tid + 1 * blockDim.x];  // g
  __syncthreads();
  pixel_dst[global_tid + 2 * blockDim.x] =
      pixel_smem_dst[local_tid + 2 * blockDim.x];  // b
};

__global__ void rgb_increase_brightness_unroll(int *pixel_dst, int *pixel_src,
                                        int size, float factor) {
  /*
    Declaration
  */
  int global_tid = blockIdx.x * blockDim.x + threadIdx.x;
  int local_tid = threadIdx.x;
  __shared__ int pixel_smem_src[4 * 3 * TILE_WIDTH];
  __shared__ int pixel_smem_dst[4 * 3 * TILE_WIDTH];

  /*
    Read input pixels to shared memory
  */
  pixel_smem_src[4 * 3 * local_tid + 0] = pixel_src[4 * 3 * global_tid + 0];  // r
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 1] = pixel_src[4 * 3 * global_tid + 1];  // g
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 2] = pixel_src[4 * 3 * global_tid + 2];  // b
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 3] = pixel_src[4 * 3 * global_tid + 3];  // r
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 4] = pixel_src[4 * 3 * global_tid + 4];  // g
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 5] = pixel_src[4 * 3 * global_tid + 5];  // b
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 6] = pixel_src[4 * 3 * global_tid + 6];  // r
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 7] = pixel_src[4 * 3 * global_tid + 7];  // g
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 8] = pixel_src[4 * 3 * global_tid + 8];  // b
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 9] = pixel_src[4 * 3 * global_tid + 9];  // r
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 10] = pixel_src[4 * 3 * global_tid + 10];  // g
  __syncthreads();
  pixel_smem_src[4 * 3 * local_tid + 11] = pixel_src[4 * 3 * global_tid + 11];  // b
  __syncthreads();

  /*
    Computation
  */
  pixel_smem_dst[4 * 3 * local_tid + 0] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 0])));
  pixel_smem_dst[4 * 3 * local_tid + 1] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 1])));
  pixel_smem_dst[4 * 3 * local_tid + 2] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 2])));
  pixel_smem_dst[4 * 3 * local_tid + 3] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 3])));
  pixel_smem_dst[4 * 3 * local_tid + 4] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 4])));
  pixel_smem_dst[4 * 3 * local_tid + 5] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 5])));
  pixel_smem_dst[4 * 3 * local_tid + 6] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 6])));
  pixel_smem_dst[4 * 3 * local_tid + 7] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 7])));
  pixel_smem_dst[4 * 3 * local_tid + 8] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 8])));
  pixel_smem_dst[4 * 3 * local_tid + 9] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 9])));
  pixel_smem_dst[4 * 3 * local_tid + 10] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 10])));
  pixel_smem_dst[4 * 3 * local_tid + 11] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 11])));
  __syncthreads();

  /*
    Write result to destination
  */
  pixel_dst[4 * 3 * global_tid + 0] = pixel_smem_dst[4 * 3 * local_tid + 0];  // r
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 1] = pixel_smem_dst[4 * 3 * local_tid + 1];  // g
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 2] = pixel_smem_dst[4 * 3 * local_tid + 2];  // b
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 3] = pixel_smem_dst[4 * 3 * local_tid + 3];  // r
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 4] = pixel_smem_dst[4 * 3 * local_tid + 4];  // g
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 5] = pixel_smem_dst[4 * 3 * local_tid + 5];  // b
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 6] = pixel_smem_dst[4 * 3 * local_tid + 6];  // r
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 7] = pixel_smem_dst[4 * 3 * local_tid + 7];  // g
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 8] = pixel_smem_dst[4 * 3 * local_tid + 8];  // b
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 9] = pixel_smem_dst[4 * 3 * local_tid + 9];  // r
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 10] = pixel_smem_dst[4 * 3 * local_tid + 10];  // g
  __syncthreads();
  pixel_dst[4 * 3 * global_tid + 11] = pixel_smem_dst[4 * 3 * local_tid + 11];  // b
  __syncthreads();
};

__global__ void rgb_increase_brightness_coalesced_unroll(int *pixel_dst,
                                                  int *pixel_src, int size,
                                                  float factor) {
  /*
    Declaration
  */
  int global_tid = 4 * 3 * blockIdx.x * blockDim.x + threadIdx.x;
  int local_tid = threadIdx.x;
  __shared__ int pixel_smem_src[4 * 3 * TILE_WIDTH];
  __shared__ int pixel_smem_dst[4 * 3 * TILE_WIDTH];

  /*
    Read input pixels to shared memory
  */
  pixel_smem_src[local_tid + 0 * blockDim.x] =
      pixel_src[global_tid + 0 * blockDim.x];  // r
  __syncthreads();
  pixel_smem_src[local_tid + 1 * blockDim.x] =
      pixel_src[global_tid + 1 * blockDim.x];  // g
  __syncthreads();
  pixel_smem_src[local_tid + 2 * blockDim.x] =
      pixel_src[global_tid + 2 * blockDim.x];  // b
  __syncthreads();
  pixel_smem_src[local_tid + 3 * blockDim.x] =
      pixel_src[global_tid + 3 * blockDim.x];  // r
  __syncthreads();
  pixel_smem_src[local_tid + 4 * blockDim.x] =
      pixel_src[global_tid + 4 * blockDim.x];  // g
  __syncthreads();
  pixel_smem_src[local_tid + 5 * blockDim.x] =
      pixel_src[global_tid + 5 * blockDim.x];  // b
  __syncthreads();
  pixel_smem_src[local_tid + 6 * blockDim.x] =
      pixel_src[global_tid + 6 * blockDim.x];  // r
  __syncthreads();
  pixel_smem_src[local_tid + 7 * blockDim.x] =
      pixel_src[global_tid + 7 * blockDim.x];  // g
  __syncthreads();
  pixel_smem_src[local_tid + 8 * blockDim.x] =
      pixel_src[global_tid + 8 * blockDim.x];  // b
  __syncthreads();
  pixel_smem_src[local_tid + 9 * blockDim.x] =
      pixel_src[global_tid + 9 * blockDim.x];  // r
  __syncthreads();
  pixel_smem_src[local_tid + 10 * blockDim.x] =
      pixel_src[global_tid + 10 * blockDim.x];  // g
  __syncthreads();
  pixel_smem_src[local_tid + 11 * blockDim.x] =
      pixel_src[global_tid + 11 * blockDim.x];  // b
  __syncthreads();

  /*
    Computation
  */
  pixel_smem_dst[4 * 3 * local_tid + 0] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 0])));
  pixel_smem_dst[4 * 3 * local_tid + 1] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 1])));
  pixel_smem_dst[4 * 3 * local_tid + 2] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 2])));
  pixel_smem_dst[4 * 3 * local_tid + 3] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 3])));
  pixel_smem_dst[4 * 3 * local_tid + 4] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 4])));
  pixel_smem_dst[4 * 3 * local_tid + 5] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 5])));
  pixel_smem_dst[4 * 3 * local_tid + 6] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 6])));
  pixel_smem_dst[4 * 3 * local_tid + 7] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 7])));
  pixel_smem_dst[4 * 3 * local_tid + 8] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 8])));
  pixel_smem_dst[4 * 3 * local_tid + 9] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 9])));
  pixel_smem_dst[4 * 3 * local_tid + 10] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 10])));
  pixel_smem_dst[4 * 3 * local_tid + 11] =
      min(255, (int)(factor * (pixel_smem_src[4 * 3 * local_tid + 11])));
  __syncthreads();

  /*
    Write result to destination
  */
  pixel_dst[global_tid + 0 * blockDim.x] =
      pixel_smem_dst[local_tid + 0 * blockDim.x];  // r
  __syncthreads();
  pixel_dst[global_tid + 1 * blockDim.x] =
      pixel_smem_dst[local_tid + 1 * blockDim.x];  // g
  __syncthreads();
  pixel_dst[global_tid + 2 * blockDim.x] =
      pixel_smem_dst[local_tid + 2 * blockDim.x];  // b
  __syncthreads();
  pixel_dst[global_tid + 3 * blockDim.x] =
      pixel_smem_dst[local_tid + 3 * blockDim.x];  // r
  __syncthreads();
  pixel_dst[global_tid + 4 * blockDim.x] =
      pixel_smem_dst[local_tid + 4 * blockDim.x];  // g
  __syncthreads();
  pixel_dst[global_tid + 5 * blockDim.x] =
      pixel_smem_dst[local_tid + 5 * blockDim.x];  // b
  __syncthreads();
  pixel_dst[global_tid + 6 * blockDim.x] =
      pixel_smem_dst[local_tid + 6 * blockDim.x];  // r
  __syncthreads();
  pixel_dst[global_tid + 7 * blockDim.x] =
      pixel_smem_dst[local_tid + 7 * blockDim.x];  // g
  __syncthreads();
  pixel_dst[global_tid + 8 * blockDim.x] =
      pixel_smem_dst[local_tid + 8 * blockDim.x];  // b
  __syncthreads();
  pixel_dst[global_tid + 9 * blockDim.x] =
      pixel_smem_dst[local_tid + 9 * blockDim.x];  // r
  __syncthreads();
  pixel_dst[global_tid + 10 * blockDim.x] =
      pixel_smem_dst[local_tid + 10 * blockDim.x];  // g
  __syncthreads();
  pixel_dst[global_tid + 11 * blockDim.x] =
      pixel_smem_dst[local_tid + 11 * blockDim.x];  // b
  __syncthreads();
};
