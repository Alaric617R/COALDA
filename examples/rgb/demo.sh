#!/bin/bash

GPU_ARCH="sm_75"
CUDA_PATH="/opt/cuda-11.7"
NVCC="/opt/cuda-11.7/bin/nvcc"

cd ../..
rm -rf build
mkdir build
cd build
cmake ..
make
cd ../examples/rgb

# Compile the CUDA device and host code to rgb_device.bc and rgb_host.o
clang++ -stdlib=libc++ --cuda-gpu-arch=${GPU_ARCH} --cuda-path=${CUDA_PATH} --cuda-device-only -emit-llvm -c rgb_pass_ready.cu -o rgb_pass_ready_device_origin.bc -Xclang -disable-O0-optnone
clang++ -stdlib=libc++ --cuda-gpu-arch=${GPU_ARCH} --cuda-path=${CUDA_PATH} --cuda-host-only -emit-llvm -c rgb_pass_ready.cu -o rgb_pass_ready_host_origin.o -Xclang -disable-O0-optnone

# Apply the pass to the device bc code
opt -load-pass-plugin ../../build/coalpass/CoalPass.so -passes=coal rgb_pass_ready_device_origin.bc -o rgb_pass_ready_device_opted.bc

# Convert rgb_device.bc to ptx
llc -march=nvptx64 -mcpu=${GPU_ARCH} rgb_pass_ready_device_opted.bc -o rgb_pass_ready_device_opted.ptx
llc -march=nvptx64 -mcpu=${GPU_ARCH} rgb_pass_ready_device_origin.bc -o rgb_pass_ready_device_origin.ptx

# Convert rgb_device.ptx to cubin
${NVCC} --gpu-architecture=${GPU_ARCH} --cubin rgb_pass_ready_device_opted.ptx
${NVCC} --gpu-architecture=${GPU_ARCH} --cubin rgb_pass_ready_device_origin.ptx

# Dlink rgb_devic.cubin with rgb_host.o and generate a rgb object file
${NVCC} --gpu-architecture=${GPU_ARCH} --device-link rgb_pass_ready_device_opted.cubin rgb_pass_ready_host_origin.o -o rgb_pass_ready_opted.o
${NVCC} --gpu-architecture=${GPU_ARCH} --device-link rgb_pass_ready_device_origin.cubin rgb_pass_ready_host_origin.o -o rgb_pass_ready_origin.o

# Assemble the device code and main to generate an executable rgb.out
${NVCC} main.cu rgb_pass_ready_opted.o -o rgb_pass_ready_opted.out
${NVCC} main.cu rgb_pass_ready_opted.o -o rgb_pass_ready_origin.out