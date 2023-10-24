# CUDA Memory Coalescing

## Problem Definition
In CUDA SIMT programming, we frequently want a consecutive region of memory get filled, such as copy data and shared memory loading.

Each thread usually works with a group of data, such as an RGB pixel, and a few adjacent matrix elements, etc.

The intuitive approach is to have each thread load the elements subsequently, yielding uncoalesced memory access and low memory bandwidth utilization.

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

### rgb.cu
In ```rgb.cu```, there are two versions of the copy function:
#### ```__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)```
which uses an intuitive, member-by-member copy.
This is common but non-coalescing.
#### ```__global__ void rgb_copy_interleaved(pixel *pixel_dst, pixel *pixel_src)```
which uses pointers to perform a strided copy.
This is coalescing.
