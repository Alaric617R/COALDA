#!/bin/bash

# TODO: Set the target GPU architecture
GPU_ARCH="sm_75"

# NOTE: If you have no inline problem, try to switch to CUDA 11.7


cd ../../build
cmake ..
make
cd ../examples/rgb

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
clang++ -stdlib=libc++ --cuda-gpu-arch=${GPU_ARCH} --cuda-device-only -emit-llvm -c ${1}.cu -o ${1}_device.bc -Xclang -disable-O0-optnone
clang++ -stdlib=libc++ --cuda-gpu-arch=${GPU_ARCH} --cuda-host-only -emit-llvm -c ${1}.cu -o ${1}_host.o -Xclang -disable-O0-optnone

# Apply the pass to the device bc code
opt -load-pass-plugin ../../build/coalpass/CoalPass.so -passes=coal ${1}_device.bc -o ${1}_device.bc

# Convert rgb_device.bc to ptx
llc -march=nvptx64 -mcpu=${GPU_ARCH} ${1}_device.bc -o ${1}_device.ptx

# Convert rgb_device.ptx to cubin
nvcc --gpu-architecture=${GPU_ARCH} --cubin ${1}_device.ptx

# Dlink rgb_devic.cubin with rgb_host.o and generate a rgb object file
nvcc --gpu-architecture=${GPU_ARCH} --device-link ${1}_device.cubin ${1}_host.o -o ${1}.o

# Assemble the device code and main to generate an executable rgb.out
nvcc main.cu ${1}.o -o ${1}.out

# Run the executable
./${1}.out

# Remove redundant files
rm *.bc *.ptx *.o
