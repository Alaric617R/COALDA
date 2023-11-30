#!/bin/bash

rm ./a.out
clang++  main.cu -o a.out --cuda-gpu-arch=sm_89 -L/opt/cuda/lib -lcudart_static -ldl -lrt -pthread

# If using cuda-11.7
clang++  main.cu -o a.out -stdlib=libc++ --cuda-path=/opt/cuda-11.7 --cuda-gpu-arch=sm_86 -L/opt/cuda-11.7/lib64 -lcudart_static -ldl -lrt -pthread

./a.out
