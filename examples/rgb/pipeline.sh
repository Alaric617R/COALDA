#!bin/bash

# Required: clang, llvm, cuda
# Adjust -arch=sm as needed

cd ../../build
cmake ..
make

cd ../examples/rgb


# Remove all previous files
rm *.bc *.ll *.ptx

# Compile the device code to LLVM IR
clang++ --cuda-gpu-arch=sm_70 -emit-llvm -c rgb.cu main.cu -Xclang -disable-O0-optnone

# Apply pass to the LLVM IR
opt -load ../../build/coalpass/CoalPass.so -passes=coal rgb.bc -o optimized.bc

# Optional: Convert the LLVM IR to human-readable format
llvm-dis *.bc

# Optional: Compile the LLVM IR to CUDA PTX
llc -march=nvptx64 -mcpu=sm_70 optimized.bc -o optimized.ptx

# Compile the host code and optimized device code to an executable
nvcc -arch=sm_70 main.cu rgb_optimized.ptx -o rgb_optimized

./rgb_optimized