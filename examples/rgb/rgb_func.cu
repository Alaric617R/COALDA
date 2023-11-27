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
    TODO: uncoalesced, with slightly complicated pattern but still a continuous
    region of memory
  */
  pixel_smem_src[3 * local_tid + 0] = pixel_src[3 * global_tid + 0];  // r
  pixel_smem_src[3 * local_tid + 1] = pixel_src[3 * global_tid + 1];  // g
  pixel_smem_src[3 * local_tid + 2] = pixel_src[3 * global_tid + 2];  // b

  /*
    Computation
  */
  pixel_smem_dst[3 * local_tid + 0] =
      min(255, (int)(factor + 1.0f) * (pixel_smem_src[3 * local_tid + 0]));
  pixel_smem_dst[3 * local_tid + 1] =
      min(255, (int)(factor + 1.0f) * (pixel_smem_src[3 * local_tid + 1]));
  pixel_smem_dst[3 * local_tid + 2] =
      min(255, (int)(factor + 1.0f) * (pixel_smem_src[3 * local_tid + 2]));

  /*
    Write result to destination
    TODO: uncoalesced
  */
  pixel_dst[3 * global_tid + 0] = pixel_smem_dst[3 * local_tid + 0];  // r
  pixel_dst[3 * global_tid + 1] = pixel_smem_dst[3 * local_tid + 1];  // g
  pixel_dst[3 * global_tid + 2] = pixel_smem_dst[3 * local_tid + 2];  // b
};
