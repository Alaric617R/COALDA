#define TILE_WIDTH 512

__global__ void rgb_increase_brightness_pass_ready(int *pixel_dst,
                                                   int *pixel_src, int size,
                                                   float factor) {
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

__global__ void rgb_increase_brightness_pass_ready_coalesced(int *pixel_dst,
                                                             int *pixel_src,
                                                             int size,
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