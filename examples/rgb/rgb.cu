struct pixel
{
  int r;
  int g;
  int b;

  bool operator==(const pixel &rhs)
  {
    return (r == rhs.r) && (g == rhs.g) && (b == rhs.b);
  };
  bool operator!=(const pixel &rhs)
  {
    return !(*this == rhs);
  }
};

// Commonly used, intuitive but uncoalesced
__global__ void rgb_copy_array_interleaved(int *pixel_dst, int *pixel_src)
{
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  int tmp = 0;
  if (tid < 16)
  {
    pixel_dst[3 * tid + 0] = pixel_src[3 * tid + 0]; // r
    if (threadIdx.x < 10)
    {
      tmp = 1;
    }
    else
    {
      tmp = 2;
    }
    pixel_dst[3 * tid + 1] = pixel_src[3 * tid + 1]; // g
    pixel_dst[3 * tid + 2] = pixel_src[3 * tid + 2]; // b
  }
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
__global__ void rgb_copy_struct_interleaved(pixel *pixel_dst, pixel *pixel_src)
{
  pixel_dst[threadIdx.x].r = pixel_src[threadIdx.x].r;
  pixel_dst[threadIdx.x].g = pixel_src[threadIdx.x].g;
  pixel_dst[threadIdx.x].b = pixel_src[threadIdx.x].b;
};

// Desired, coalesced
__global__ void rgb_copy_struct_coalesced(pixel *pixel_dst, pixel *pixel_src)
{
  int *ptr_src = (int *)pixel_src;
  int *ptr_dst = (int *)pixel_dst;
  ptr_dst[threadIdx.x + 0 * blockDim.x] = ptr_src[threadIdx.x + 0 * blockDim.x];
  ptr_dst[threadIdx.x + 1 * blockDim.x] = ptr_src[threadIdx.x + 1 * blockDim.x];
  ptr_dst[threadIdx.x + 2 * blockDim.x] = ptr_src[threadIdx.x + 2 * blockDim.x];
};

__global__ void rgb_copy_struct_whole(pixel *pix_dst, pixel *pixel_src)
{
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  pix_dst[tid] = pixel_src[tid];
};
