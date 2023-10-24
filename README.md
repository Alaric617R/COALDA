# CUDA Memory Coalescing

## CUDA to LLVM

### Compile CUDA Executable
```bash
clang++ -stdlib=libc++ axpy.cu -o axpy.out \
--cuda-gpu-arch=sm_89 -L/opt/cuda/lib -lcudart_static -ldl -lrt -pthread
```
### Convert Source Code to BC
```bash
clang++ -stdlib=libc++ -emit-llvm -c axpy.cu -Xclang -disable-O0-optnone
```
### Convert BC to IR
```bash
llvm-dis *.bc
```
