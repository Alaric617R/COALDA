struct pixel {
  int r;
  int g;
  int b;
};

__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src) {
  pixel_dst[threadIdx.x].r = pixel_src[threadIdx.x].r;
  pixel_dst[threadIdx.x].g = pixel_src[threadIdx.x].g;
  pixel_dst[threadIdx.x].b = pixel_src[threadIdx.x].b;
};

__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src) {
  int *ptr_src = (int *)pixel_src;
  int *ptr_dst = (int *)pixel_dst;
  ptr_src[threadIdx.x + 0 * blockDim.x] = ptr_dst[threadIdx.x + 0 * blockDim.x];
  ptr_src[threadIdx.x + 1 * blockDim.x] = ptr_dst[threadIdx.x + 1 * blockDim.x];
  ptr_src[threadIdx.x + 2 * blockDim.x] = ptr_dst[threadIdx.x + 2 * blockDim.x];
};
