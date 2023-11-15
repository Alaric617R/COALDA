# CUDA Memory Coalescing

## Problem Definition
In CUDA SIMT programming, we frequently want a consecutive region of memory get filled, such as copy data and shared memory loading.

Each thread usually works with a group of data, such as an RGB pixel, and a few adjacent matrix elements, etc.

The intuitive approach is to have each thread load the elements subsequently, yielding uncoalesced memory access and low memory bandwidth utilization.

![image](https://github.com/zianglih/EECS583_Project/assets/40673516/c29dc0fe-c1b0-4880-be0f-222297b7720a)



For example, suppose n vector of length m are stored in a linear fashion. Element i of vector j denoted as $V_j^i$. Earch thread in the GPU kernel is assigned to one-m length vector. Threads in CUDA are grouped in an array of blocks and every thread in GPU has a unique id which can be defined as $indx = bd*bx +tx$, where bd is rerpesents the block dimension, bx represents the block index, and tx is the offset in a block.

In the case where we want to access thr first components of each vector i.e. address 0, m, 2m ... of the memory, a lot of store and load would need to be performed by the GPU kernel because the size of each load only guarantees one such address. It is trickier since the allowed size of residing threads per GPU block is bd. The solution is to store data in the following fashion: store the first elements of the first bd vectors in consecutive order, followed by the first element of the second bd vectors and so on. The rest of the elements are stored in a similar fashion. If n is not a factor of bdit is needed to pad the remaining data in the last block with some trivial value like 0.

In the linear data storage described above, component i(0 <= i < m) of vector indx (0<=indx<n) is addressed by $m * indx + i$; the same component in the coalesced storage pattern is addressed as $(m*bd)*ixC + bd * ixB + ixA$, where $ixC = floor[(m.indx + i)/(m.bd)]=bx$, $ixB=i$, $ixA=mod(indx,bd)=tx$.
The original linear indexing is mapped to coalesced indexing according to $$m.indx+i \rightarrow m.bd.bx+i.bd+tx$$.

We want to identify such patterns and use compiler pass to reorgnize them to a strided pattern.
Currently we only consider the case that all threads filling a consecutive region in memory so that we can neglect which thread holds which data.


## Solution Overview

There are overall two steps:

### Summarize the access region

### Restructure to strided pattern

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

To verify the correctness of a pass, compile and run ```main.cpp```.

![image](https://github.com/zianglih/EECS583_Project/assets/52993433/88bfcad0-6f1a-4e49-8d31-1c58e497c5d8)


### rgb.cu
In ```rgb.cu```, there are two versions of the copy function:
#### ```__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)```
which uses an intuitive, member-by-member copy.
This is common but non-coalescing.
#### ```__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)```
which uses pointers to perform a strided copy.
This is coalescing.


## Useful Resources
### Compilations & Linking
https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html

https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#using-separate-compilation-in-cuda
### Identify Uncoalesced Patterns
https://www.cis.upenn.edu/~alur/Cav17.pdf

https://github.com/upenn-acg/gpudrano-static-analysis_v1.0

https://forums.developer.nvidia.com/t/detect-memory-coalescing-from-sass-file/238896

### Benchmark for Performance Testing
https://github.com/yuhc/gpu-rodinia
