# Compile the .cu into .ll (bitcode file):
```
clang++ -S -emit-llvm --cuda-gpu-arch=sm_<compute_cap> <target.cu>
```
__compute_cap__: computing capability of current gpu
```cpp
// Have the navidia pacakge installed
// in terminal:
nvidia-smi --query-gpu=compute_cap --format=csv

// sample output:
compute_cap
8.9

// compile command:
clang++ -S -emit-llvm --cuda-gpu-arch=sm_89 rgb.cu
```
