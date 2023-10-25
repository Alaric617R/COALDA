/*
    A: m x n
    B: n x p
    C: m x p
    For simplicity, assume dimensions are multiple of TILE_WIDTH
*/

 #define TILE_WIDTH 16

__global__ void gemm(const float* A, const float* B, float* C, int m, int n, int p) {
  __shared__ float As[TILE_WIDTH][TILE_WIDTH];
  __shared__ float Bs[TILE_WIDTH][TILE_WIDTH];
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  int col = blockIdx.x * blockDim.x + threadIdx.x;
  float sum = 0;
  for (int k = 0; k < n; k+= TILE_WIDTH) {
    As[threadIdx.y][threadIdx.x] = A[row * n + (k + threadIdx.x)];
    Bs[threadIdx.y][threadIdx.x] = B[(k + threadIdx.y) * p + col];
    __syncthreads();
    for (int i = 0; i < TILE_WIDTH; i++) {
      sum += As[threadIdx.y][i] * Bs[i][threadIdx.x];
    }
    __syncthreads();
  }
  C[row * p + col] = sum;
}