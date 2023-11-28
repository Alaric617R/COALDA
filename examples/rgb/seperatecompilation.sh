#!/bin/bash

# Set paths to your CUDA and Clang installations if they're not in your PATH
CUDA_PATH="/opt/cuda/bin"
CLANG_PATH="/usr/bin/clang"

# Set the target GPU architecture
GPU_ARCH="sm_75"

# Compile the CUDA device code for rgb.cu
$CLANG_PATH/clang --cuda-gpu-arch=$GPU_ARCH -c rgb.cu -o /tmp/rgb-sm_75.s

# Assemble the device code
$CUDA_PATH/ptxas /tmp/rgb-sm_75.s -o /tmp/rgb-sm_75.o

# Link to create a fat binary
$CUDA_PATH/fatbinary --create=/tmp/rgb-b8d9fd.fatbin --image=profile=compute_$GPU_ARCH,file=/tmp/rgb-sm_35.o

# Compile the host code for rgb.cu
$CLANG_PATH/clang -c rgb.cu -o /tmp/rgb-e979a2.o --cuda-path=$CUDA_PATH --cuda-include-path=$CUDA_PATH/include

# Repeat the process for main.cu
$CLANG_PATH/clang --cuda-gpu-arch=$GPU_ARCH -c main.cu -o /tmp/main-sm_35.s
$CUDA_PATH/ptxas /tmp/main-sm_35.s -o /tmp/main-sm_35.o