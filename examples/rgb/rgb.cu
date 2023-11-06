#define TILE_WIDTH 32

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
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  pixel_dst[tid + 0 * blockDim.x] = pixel_src[tid + 0 * blockDim.x]; // r/g/b stride 1
  pixel_dst[tid + 1 * blockDim.x] = pixel_src[tid + 1 * blockDim.x]; // r/g/b stride 2
  pixel_dst[tid + 2 * blockDim.x] = pixel_src[tid + 2 * blockDim.x]; // r/g/b stride 3
};

// Commonly used, intuitive but uncoalesced
// Functionality: averaging, new_r/g/b = 0.5 * curr_r/g/b + 0.5 * right_r/g/b
// Assumption: the total number of pixels is a multiple of our TILE_WIDTH and aka blockDim.x
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
  __shared__ bool valid_tail;

  /*
    Check if we want to load extra tail element
    Note we only need one thread for computing this
  */
  if (local_tid == TILE_WIDTH - 1)
  {
    valid_tail = (global_tid + 1 < size); // e.g. global_tid = 31, size = 32, invalid tail; global_tid = 31, size = 33, valid tail
  }

  /*
    Read input pixels to shared memory
    TODO: uncoalesced, with slightly complicated pattern but still a continuous region of memory
  */
  pixel_smem_src[3 * local_tid + 0] = pixel_src[3 * global_tid + 0]; // r
  pixel_smem_src[3 * local_tid + 1] = pixel_src[3 * global_tid + 1]; // g
  pixel_smem_src[3 * local_tid + 2] = pixel_src[3 * global_tid + 2]; // b
  if (valid_tail && local_tid < 3)
  {
    pixel_smem_src[3 * TILE_WIDTH + local_tid] = pixel_src[3 * TILE_WIDTH + local_tid];
  }

  /*
    Computation
  */
  pixel_smem_dst[3 * local_tid + 0] = pixel_smem_src[3 * local_tid + 0] + pixel_smem_dst[3 * (local_tid + 1) + 0];
  pixel_smem_dst[3 * local_tid + 1] = pixel_smem_src[3 * local_tid + 1] + pixel_smem_dst[3 * (local_tid + 1) + 1];
  pixel_smem_dst[3 * local_tid + 2] = pixel_smem_src[3 * local_tid + 2] + pixel_smem_dst[3 * (local_tid + 1) + 2];

  /*
    Write result to destination
    TODO: uncoalesced
  */
  pixel_dst[3 * global_tid + 0] = pixel_smem_src[3 * local_tid + 0]; // r
  pixel_dst[3 * global_tid + 1] = pixel_smem_src[3 * local_tid + 1]; // g
  pixel_dst[3 * global_tid + 2] = pixel_smem_src[3 * local_tid + 2]; // b
};