#!/bin/bash

# ACTION NEEDED: If the path is different, please update it here.
# PATH2LIB="/home/zihaoye/Documents/EECS583_Project/build/coalpass/CoalPass.so"        # Specify your build directory in the project
PATH2LIB="/home/arch/Desktop/EECS583_Project/build/coalpass/CoalPass.so"        # Specify your build directory in the project
PASS=coal

opt -load-pass-plugin="${PATH2LIB}" -passes="${PASS}" main-cuda-nvptx64-nvidia-cuda-sm_86.bc -o main-cuda-nvptx64-nvidia-cuda-sm_86_out.bc

echo "Alaric"
# rm -f tmp.bc.out

# r -load-pass-plugin=/home/arch/Desktop/EECS583_Project/build/coalpass/CoalPass.so -passes=coal /home/arch/Desktop/EECS583_Project/examples/rgb/rgb-cuda-nvptx64-nvidia-cuda-sm_89.bc