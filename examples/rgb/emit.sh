#!/bin/bash

rm *.bc *.ll
clang++ -std=c++20 -stdlib=libc++ --cuda-path=/opt/cuda-11.7 --cuda-gpu-arch=sm_86 -emit-llvm -c rgb.cu main.cu -Xclang -disable-O0-optnone
llvm-dis *.bc

