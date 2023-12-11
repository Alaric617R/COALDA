#include <cstdio>

#include "ppm_utils.h"
// #include "rgb_pass_ready.cu"

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
    "Gather": Read input pixels to shared memory
  */
  pixel_smem_src[3 * local_tid + 0] = pixel_src[3 * global_tid + 0];  // r
  __syncthreads();
  pixel_smem_src[3 * local_tid + 1] = pixel_src[3 * global_tid + 1];  // g
  __syncthreads();
  pixel_smem_src[3 * local_tid + 2] = pixel_src[3 * global_tid + 2];  // b
  __syncthreads();

  /*
    Computation, very simple here but can be more complicated
  */
  pixel_smem_dst[3 * local_tid + 0] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 0])));
  pixel_smem_dst[3 * local_tid + 1] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 1])));
  pixel_smem_dst[3 * local_tid + 2] =
      min(255, (int)(factor * (pixel_smem_src[3 * local_tid + 2])));
  __syncthreads();

  /*
    "Scatter": Write result to destination
  */
  pixel_dst[3 * global_tid + 0] = pixel_smem_dst[3 * local_tid + 0];  // r
  __syncthreads();
  pixel_dst[3 * global_tid + 1] = pixel_smem_dst[3 * local_tid + 1];  // g
  __syncthreads();
  pixel_dst[3 * global_tid + 2] = pixel_smem_dst[3 * local_tid + 2];  // b
};

void test_increase_brightness_pass_ready() {

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
  rgb_increase_brightness_pass_ready<<<dimGrid, dimBlock>>>(
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
  test_increase_brightness_pass_ready();
  return 0;
}