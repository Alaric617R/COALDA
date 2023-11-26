# COALDA - Compiler Optimization for CUDA Memory Coalescing

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

### Recognize uncoalesced access regions
Since we're focusing on data copy between host memory and device memory, our approach targets store operations as starting point. We noticed that stores that relates to large data copies are frequently coupled with GEP operations both in their value and pointer operands. Then, we set off to analyse the addresses accessed by GEPs operations to determine whether they're related to SIMD instructions. We achieve this by walking backwards the dependence tree of the addresses being calculated. We created our heuristic to identify all possible uncoalesced addresses accessed by SIMD operations: a finite automata that is used to traverse and parse the dependence tree. Each node in the finite automata represents a possible symbol or transformation, which can be binary operators representing calculation, propagate operation that transfer to next node, symbols that related to SIMD operations such as thread id, block index, etc. By integrating our own heuristic to backward dataflow analysis, COALDA is able to filter out all false positive uncoalesced memory accesses, a great promise to correctness after optimization. 
To further identify uncoalesced memory addresses, we defined the canonical expression for an uncoalesced memory address: `stride * (globalTID/localTID) + offset`. `stride` is usually the size of unit data structure being copied or transmitted, which must be greater than 1. `globalTID/localTID` is the index of thread in each thread blocks. If there are more than one thread blocks, then the thread index will be global. `offset` is the byte index of the element in the data structure that is being transferred by the current thread. We created our own AST to parse the addresses from backward dataflow analysis into this canonical address form, and further classified store operations into groups that has the similar canonical expression.

### Restructure to unstrided patterns
COALDA is able to restructure uncoalesced memory accesses back to coalesced ones according to the group classification done in the recognization step. In general, if the `stride` and `globalTID/localTID` field in the canonical expression match, plus the base pointer two stores operates on being the same, then two stores can be coalesced. That is because they're transferring different parts of the same data structure. However, because of `stride`, DRAM bursts utilization is low since there are unwanted datum in each DRAM row access. The coalescing step is to reduce the `stride` factor back to one, which is done by reassigning addresses for stores in the same group. COALDA only considers data copies that will cover the whole contiguous memory region, for example, transferring the whole RGB pixel rather than R and G field excluding B. By address recalculations, threads in SIMD will transfer the whole data structure in one go rather than each different byte in the data structure, fully utilization DRAM burst because memory being accessed in contiguous. COALDA achieves by transforming original GEP operations in stores' operands to access coalesced memory. After that it peroforms dead code elimination to erase original address calculations.

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
