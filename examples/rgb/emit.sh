#!/bin/bash

rm *.bc *.ll *.ptx
clang++ --cuda-gpu-arch=sm_89 -emit-llvm -c rgb.cu main.cu -Xclang -disable-O0-optnone
llvm-dis *.bc

nvcc --ptx rgb.cu
