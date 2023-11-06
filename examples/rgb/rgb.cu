struct pixel
{
  int r;
  int g;
  int b;
};

// Commonly used, intuitive but uncoalesced
__global__ void rgb_copy_array_interleaved(int *pixel_dst, int *pixel_src)
{
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  int disrupt = tid;
  pixel_dst[3 * tid + 0] = pixel_src[3 * tid + 0]; // r
  pixel_dst[3 * tid + 1] = pixel_src[3 * tid + 1]; // g
  pixel_dst[3 * tid + 2] = pixel_src[3 * tid + 2]; // b
  if (disrupt > 10) disrupt = disrupt * 2;
};

// Desired, coalesced
__global__ void rgb_copy_array_coalesced(int *pixel_dst, int *pixel_src)
{
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  pixel_dst[tid + 0 * blockDim.x] = pixel_src[tid + 0 * blockDim.x]; // r/g/b stride 1
  pixel_dst[tid + 1 * blockDim.x] = pixel_src[tid + 1 * blockDim.x]; // r/g/b stride 2
  pixel_dst[tid + 2 * blockDim.x] = pixel_src[tid + 2 * blockDim.x]; // r/g/b stride 3
};

