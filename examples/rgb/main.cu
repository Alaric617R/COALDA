#include "rgb.cu"

int main()
{
    pixel host_pixel[32];
    for (int i = 0; i < 32; i++)
    {
        host_pixel[i] = {i, i, i};
    }
    pixel *device_pixel_src;

    cudaMalloc(&device_pixel_src, 32 * sizeof(pixel));

    cudaMemcpy(device_pixel_src, host_pixel, 32 * sizeof(pixel), cudaMemcpyHostToDevice);

    dim3 dimGrid = (32, 1, 1);
    dim3 dimBlock = (32, 1, 1);

    rgb_smem_interleaved<<<dimGrid, dimBlock, 32 * sizeof(pixel)>>>(device_pixel_src);
    cudaDeviceSynchronize();

    cudaFree(device_pixel_src);
    free(host_pixel);

    return 0;
}