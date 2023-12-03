#!/bin/bash

# Set paths to your CUDA and Clang installations if they're not in your PATH
CUDA_PATH="/opt/cuda-11.7/bin"
CLANG_PATH="/usr/bin"

# Set the target GPU architecture
GPU_ARCH="sm_75"

rm *.bc *.ll *.ptx *.o *.fatbin

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
clang++ -stdlib=libc++ --cuda-gpu-arch=sm_75 --cuda-device-only -emit-llvm -c rgb.cu -o rgb_device.bc -Xclang -disable-O0-optnone
clang++ -stdlib=libc++ --cuda-gpu-arch=sm_75 --cuda-host-only -emit-llvm -c rgb.cu -o rgb_host.o -Xclang -disable-O0-optnone
# nvlink --arch=sm_75 rgb.bc rgb-cuda-nvptx64-nvidia-cuda-sm_75.bc
opt -load-pass-plugin ../../build/coalpass/CoalPass.so -passes=coal rgb_device.bc -o rgb_device.bc
llc -march=nvptx64 -mcpu=sm_75 rgb_device.bc -o rgb_device.ptx
nvcc --gpu-architecture=sm_75 --cubin rgb_device.ptx
nvcc --gpu-architecture=sm_75 --device-link rgb_device.cubin rgb_host.o -o rgb.o
# Assemble the device code and host code
nvcc main.cu rgb.o -o rgb.out

rm *.bc *.ll *.ptx *.o *.fatbin