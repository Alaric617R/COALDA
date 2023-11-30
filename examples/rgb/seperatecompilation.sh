#!/bin/bash

# Set paths to your CUDA and Clang installations if they're not in your PATH
CUDA_PATH="/opt/cuda/bin"
CLANG_PATH="/usr/bin"

# Set the target GPU architecture
GPU_ARCH="sm_75"

rm *.bc *.ll *.ptx

#following the below process
# "nvptx64-nvidia-cuda" - "clang", inputs: ["rgb.cu"], output: "/tmp/rgb-c42443/rgb-sm_35.s"
# "nvptx64-nvidia-cuda" - "NVPTX::Assembler", inputs: ["/tmp/rgb-c42443/rgb-sm_35.s"], output: "/tmp/rgb-d56ddb/rgb-sm_35.o"
# "nvptx64-nvidia-cuda" - "NVPTX::Linker", inputs: ["/tmp/rgb-d56ddb/rgb-sm_35.o", "/tmp/rgb-c42443/rgb-sm_35.s"], output: "/tmp/rgb-25be7e.fatbin"
# "x86_64-pc-linux-gnu" - "clang", inputs: ["rgb.cu", "/tmp/rgb-25be7e.fatbin"], output: "/tmp/rgb-2642c4.o"
# "nvptx64-nvidia-cuda" - "clang", inputs: ["main.cu"], output: "/tmp/main-99237c/main-sm_35.s"
# "nvptx64-nvidia-cuda" - "NVPTX::Assembler", inputs: ["/tmp/main-99237c/main-sm_35.s"], output: "/tmp/main-148b92/main-sm_35.o"
# "nvptx64-nvidia-cuda" - "NVPTX::Linker", inputs: ["/tmp/main-148b92/main-sm_35.o", "/tmp/main-99237c/main-sm_35.s"], output: "/tmp/main-93db48.fatbin"
# "x86_64-pc-linux-gnu" - "clang", inputs: ["main.cu", "/tmp/main-93db48.fatbin"], output: "/tmp/main-9b99b7.o"
# "x86_64-pc-linux-gnu" - "GNU::Linker", inputs: ["/tmp/rgb-2642c4.o", "/tmp/main-9b99b7.o"], output: "a.out"

# Compile the CUDA device code for rgb.cu
# $CLANG_PATH/clang --cuda-gpu-arch=$GPU_ARCH -c rgb.cu -o ./tmp/rgb-sm_75.s
clang++ --cuda-gpu-arch=sm_75 --cuda-device-only -emit-llvm -c rgb.cu -o rgb_device.bc -Xclang -disable-O0-optnone
opt -load-pass-plugin ../../build/coalpass/CoalPass.so -passes=coal rgb_device.bc -o rgb_device.bc
llc -march=nvptx64 -mcpu=sm_75 rgb_device.bc -o rgb_device.ptx

# Assemble the device code
$CUDA_PATH/ptxas -c rgb_device.ptx --gpu-name=sm_75 -o rgb_device.o

# Linker stage
$CUDA_PATH/ptxas - rgb_device.ptx --gpu-name=sm_75 -o rgb_device.o
$CUDA_PATH/fatbinary --link -create rgb_device.fatbin --image=profile=sm_75,file=rgb_device.o --64

# Link to create a fat binary
clang++ --cuda-gpu-arch=sm_75 rgb.cu rgb_device.fatbin -o rgb_device_final.o

#TODO: Compile rgb.cu to host only
clang++ --cuda-gpu-arch=sm_75 --cuda-host-only -emit-llvm -c main.cu -o rgb_host.bc -Xclang -disable-O0-optnone

$CUDA_PATH/ptxas -c rgb_device.ptx --gpu-name=sm_75 -o rgb_device.o



# Compile the host code for main.cu
clang++ --cuda-gpu-arch=sm_75 --cuda-host-only -emit-llvm -c main.cu -o main.bc -Xclang -disable-O0-optnone

# Repeat the process for main.cu
$CLANG_PATH/clang --cuda-gpu-arch=$GPU_ARCH -c main.cu -o ./tmp/main-sm_75.s
$CUDA_PATH/ptxas ./tmp/main-sm_75.s -o ./tmp/main-sm_75.o