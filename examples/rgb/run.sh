#!/bin/bash

# TODO: Set the target GPU architecture
GPU_ARCH="sm_75"

# NOTE: If you have no inline problem, try to switch to CUDA 11.7

# Seperate Compilation follows the below process
# "nvptx64-nvidia-cuda" - "clang", inputs: ["rgb.cu"], output: "/tmp/rgb-c42443/rgb-sm_35.s"
# "nvptx64-nvidia-cuda" - "NVPTX::Assembler", inputs: ["/tmp/rgb-c42443/rgb-sm_35.s"], output: "/tmp/rgb-d56ddb/rgb-sm_35.o"
# "nvptx64-nvidia-cuda" - "NVPTX::Linker", inputs: ["/tmp/rgb-d56ddb/rgb-sm_35.o", "/tmp/rgb-c42443/rgb-sm_35.s"], output: "/tmp/rgb-25be7e.fatbin"
# "x86_64-pc-linux-gnu" - "clang", inputs: ["rgb.cu", "/tmp/rgb-25be7e.fatbin"], output: "/tmp/rgb-2642c4.o"
# "nvptx64-nvidia-cuda" - "clang", inputs: ["main.cu"], output: "/tmp/main-99237c/main-sm_35.s"
# "nvptx64-nvidia-cuda" - "NVPTX::Assembler", inputs: ["/tmp/main-99237c/main-sm_35.s"], output: "/tmp/main-148b92/main-sm_35.o"
# "nvptx64-nvidia-cuda" - "NVPTX::Linker", inputs: ["/tmp/main-148b92/main-sm_35.o", "/tmp/main-99237c/main-sm_35.s"], output: "/tmp/main-93db48.fatbin"
# "x86_64-pc-linux-gnu" - "clang", inputs: ["main.cu", "/tmp/main-93db48.fatbin"], output: "/tmp/main-9b99b7.o"
# "x86_64-pc-linux-gnu" - "GNU::Linker", inputs: ["/tmp/rgb-2642c4.o", "/tmp/main-9b99b7.o"], output: "a.out"

# Compile the CUDA device and host code to rgb_device.bc and rgb_host.o
clang++ -stdlib=libc++ --cuda-gpu-arch=${GPU_ARCH} --cuda-device-only -emit-llvm -c rgb.cu -o rgb_device.bc -Xclang -disable-O0-optnone
clang++ -stdlib=libc++ --cuda-gpu-arch=${GPU_ARCH} --cuda-host-only -emit-llvm -c rgb.cu -o rgb_host.o -Xclang -disable-O0-optnone

# Apply the pass to the device bc code
opt -load-pass-plugin ../../build/coalpass/CoalPass.so -passes=coal rgb_device.bc -o rgb_device.bc

# Convert rgb_device.bc to ptx
llc -march=nvptx64 -mcpu=${GPU_ARCH} rgb_device.bc -o rgb_device.ptx

# Convert rgb_device.ptx to cubin
nvcc --gpu-architecture=${GPU_ARCH} --cubin rgb_device.ptx

# Dlink rgb_devic.cubin with rgb_host.o and generate a rgb object file
nvcc --gpu-architecture=${GPU_ARCH} --device-link rgb_device.cubin rgb_host.o -o rgb.o

# Assemble the device code and main to generate an executable rgb.out
nvcc main.cu rgb.o -o rgb.out

# Run the executable
./rgb.out

# Remove redundant files
rm *.bc *.ptx *.o