#include <cstdio>

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
__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)
{
  pixel_dst[threadIdx.x].r = pixel_src[threadIdx.x].r;
  pixel_dst[threadIdx.x].g = pixel_src[threadIdx.x].g;
  pixel_dst[threadIdx.x].b = pixel_src[threadIdx.x].b;
};

int main()
{
  pixel host_pixel_src[32];
  pixel host_pixel_res[32];
  pixel *device_pixel_src;
  pixel *device_pixel_cpy;

  srand(1);
  for (int i = 0; i < 32; i++)
  {
    host_pixel_src[i] = {rand() % 256, rand() % 256, rand() % 256};
  }

  printf("Host data initialized:\n");
  for (int i = 0; i < 32; i++)
  {
    printf("%d %d %d %d\n", i, host_pixel_src[i].r, host_pixel_src[i].g, host_pixel_src[i].b);
  }

  cudaMalloc(&device_pixel_src, 32 * sizeof(pixel));
  cudaMalloc(&device_pixel_cpy, 32 * sizeof(pixel));

  cudaMemcpy(device_pixel_src, host_pixel_src, 32 * sizeof(pixel), cudaMemcpyHostToDevice);

  dim3 dimGrid = dim3(1, 1, 1);
  dim3 dimBlock = dim3(32, 1, 1);

  rgb_copy_interleaved<<<dimGrid, dimBlock, 32 * sizeof(pixel)>>>(device_pixel_cpy, device_pixel_src);
  cudaDeviceSynchronize();

  cudaMemcpy(host_pixel_res, device_pixel_cpy, 32 * sizeof(pixel), cudaMemcpyDeviceToHost);
  cudaDeviceSynchronize();

  bool success = true;
  printf("Data after device internal copy:\n");
  for (int i = 0; i < 32; i++)
  {
    printf("%d %d %d %d\n", i, host_pixel_res[i].r, host_pixel_res[i].g, host_pixel_res[i].b);
    if (host_pixel_res[i] != host_pixel_src[i]) {
      success = false;
      printf("Error on pixel %d\n", i);
    }
  }
  if (success) {
    printf("All matched!\n");
  }

  cudaFree(device_pixel_src);
  cudaFree(device_pixel_cpy);

  return 0;
}