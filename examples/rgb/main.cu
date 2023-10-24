#include "rgb.cu"
#include <cstdio>

int main()
{
  pixel host_pixel[32];
  pixel *device_pixel_src;
  pixel *device_pixel_cpy;

  srand(1);
  for (int i = 0; i < 32; i++)
  {
    host_pixel[i] = {rand() % 256, rand() % 256, rand() % 256};
  }

  printf("Host data initialized:\n");
  for (int i = 0; i < 32; i++)
  {
    printf("%d %d %d %d\n", i, host_pixel[i].r, host_pixel[i].g, host_pixel[i].b);
  }

  cudaMalloc(&device_pixel_src, 32 * sizeof(pixel));
  cudaMalloc(&device_pixel_src, 32 * sizeof(pixel));

  cudaMemcpy(device_pixel_src, host_pixel, 32 * sizeof(pixel),
             cudaMemcpyHostToDevice);

  dim3 dimGrid = (32, 1, 1);
  dim3 dimBlock = (32, 1, 1);

  rgb_copy_interleaved<<<dimGrid, dimBlock, 32 * sizeof(pixel)>>>(
      device_pixel_src, device_pixel_cpy);
  cudaDeviceSynchronize();

  cudaFree(device_pixel_src);
  free(host_pixel);

  return 0;
}