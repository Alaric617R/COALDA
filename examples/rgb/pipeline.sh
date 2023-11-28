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
clang++ --cuda-gpu-arch=sm_70 --cuda-device-only -emit-llvm -c rgb.cu -o rgb.bc -Xclang -disable-O0-optnone

# Apply pass to the LLVM IR
opt -load-pass-plugin ../../build/coalpass/CoalPass.so -passes=coal rgb.bc -o optimized.bc

# Optional: Convert the LLVM IR to human-readable format
llvm-dis *.bc

# Compile the LLVM IR to CUDA PTX
llc -march=nvptx64 -mcpu=sm_70 optimized.bc -o optimized.ptx
clang -Xcuda

# Compile the host code and optimized device code to an executable
clang -arch=sm_75 main.cu rgb_optimized.ptx -o rgb_optimized

./rgb_optimized