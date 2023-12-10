#include <cstdio>

#include "ppm_utils.h"
#include "rgb_pass_ready_coalesced.cu"

#define TILE_WIDTH 512

void test_increase_brightness_pass_ready_coalesced() {
  /*
    Declaration and configuration
  */
  int width, height;
  int *host_pixel_src = read_ppm("images/1.ppm", width, height);
  long long total_pixel = width * height;
  int num_block = (total_pixel + TILE_WIDTH - 1) / TILE_WIDTH;
  const dim3 dimGrid = dim3(num_block, 1, 1);
  const dim3 dimBlock = dim3(TILE_WIDTH, 1, 1);
  int num_pixels = width * height;
  int host_pixel_res[3 * num_pixels];
  int *device_pixel_src;
  int *device_pixel_cpy;

  /*
    Allocate host and device memory
  */
  cudaMalloc(&device_pixel_src, 3 * num_pixels * sizeof(int));
  cudaMalloc(&device_pixel_cpy, 3 * num_pixels * sizeof(int));

  /*
    Data movement and kernel launch
  */
  cudaMemcpy(device_pixel_src, host_pixel_src, 3 * num_pixels * sizeof(int),
             cudaMemcpyHostToDevice);
  rgb_increase_brightness_pass_ready_coalesced<<<dimGrid, dimBlock>>>(
      device_pixel_cpy, device_pixel_src, width * height, 1.8);
  cudaDeviceSynchronize();
  cudaMemcpy(host_pixel_res, device_pixel_cpy, 3 * num_pixels * sizeof(int),
             cudaMemcpyDeviceToHost);
  cudaDeviceSynchronize();

  /*
    Write result to output file
  */
  write_ppm("images/1_modified.ppm", host_pixel_res, width, height);

  /*
    Free host and device memory
  */
  delete[] host_pixel_src;
  cudaFree(device_pixel_src);
  cudaFree(device_pixel_cpy);
}

int main() {
  test_increase_brightness_pass_ready_coalesced();
  return 0;
}