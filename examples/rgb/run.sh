#!/bin/bash

rm ./a.out
clang++ -stdlib=libc++ main.cu -o a.out --cuda-gpu-arch=sm_89 -L/opt/cuda/lib -lcudart_static -ldl -lrt -pthread
./a.out
