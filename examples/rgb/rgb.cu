struct pixel
{
    int r;
    int g;
    int b;
};

__global__ void rgb_smem_interleaved(pixel *pixel_src)
{
    extern __shared__ pixel pixel_dst[];
    // For testing bandwidth, load 4 times repeatedly
    # pragma unroll
    for (size_t i = 0; i < 4; i++)
    {
        pixel_dst[threadIdx.x].r = pixel_src[threadIdx.x].r;
        pixel_dst[threadIdx.x].g = pixel_src[threadIdx.x].g;
        pixel_dst[threadIdx.x].b = pixel_src[threadIdx.x].b;
        __syncthreads();
    }
};

__global__ void rgb_smem_coalesced(pixel *pixel_src)
{
    extern __shared__ pixel pixel_dst[];
    int *ptr_src = (int *)pixel_src;
    int *ptr_dst = (int *)pixel_dst;
    // For testing bandwidth, load 4 times repeatedly
    # pragma unroll
    for (size_t i = 0; i < 4; i++)
    {
        ptr_src[threadIdx.x + 0 * blockDim.x] = ptr_dst[threadIdx.x + 0 * blockDim.x];
        ptr_src[threadIdx.x + 1 * blockDim.x] = ptr_dst[threadIdx.x + 1 * blockDim.x];
        ptr_src[threadIdx.x + 2 * blockDim.x] = ptr_dst[threadIdx.x + 2 * blockDim.x];
        __syncthreads();
    }
};