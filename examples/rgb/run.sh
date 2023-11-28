#!/bin/bash

rm ./a.out
clang++  main.cu -o a.out --cuda-gpu-arch=sm_75 -L/opt/cuda/lib -lcudart_static -ldl -lrt -pthread
./a.out
