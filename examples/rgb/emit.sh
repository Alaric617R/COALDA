#!/bin/bash

rm *.bc *.ll
clang++ -stdlib=libc++ --cuda-gpu-arch=sm_89 -emit-llvm -c rgb.cu main.cu -Xclang -disable-O0-optnone
llvm-dis *.bc
