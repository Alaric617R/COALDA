# CUDA Memory Coalescing

## CUDA to LLVM

### Compile CUDA Executable
This is to compile the whole program as an executable.
```bash
clang++ -stdlib=libc++ main.cu -o a.out \
--cuda-gpu-arch=sm_89 -L/opt/cuda/lib -lcudart_static -ldl -lrt -pthread
```
Remeber to substitude ```--cuda-gpu-arch``` and ```-L``` correspondingly.
### Convert Source Code to BC
This is to generate ```.bc``` files for only the CUDA functions.
```bash
clang++ -stdlib=libc++ -emit-llvm -c rgb.cu -Xclang -disable-O0-optnone
```
### Convert BC to IR
This is to convert ```.bc``` files to human-readable ```.ll``` IRs.
```bash
llvm-dis *.bc
```

## RGB
This is a minimal example, initializing ```32``` random pixels and copy them on the device.

### rgb.cu
In ```rgb.cu```, there are two versions of the copy function:
#### ```__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)```
which uses an intuitive, member-by-member copy.
This is common but non-coalescing.
#### ```__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)```
which uses pointers to perform a strided copy.
This is coalescing.
