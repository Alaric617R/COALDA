#!/bin/bash

# ACTION NEEDED: If the path is different, please update it here.
PATH2LIB="../../build/coalpass/CoalPass.so"        # Specify your build directory in the project
PASS=coal

# Delete outputs from previous runs. Update this when you want to retain some files.
rm -f default.profraw *_prof *_fplicm *.bc *.profdata *_output *.ll

# ACTION NEEDED: If the gpu compute capability is different, please update it here
# Convert source code to bitcode (IR).
clang++ -c -emit-llvm --cuda-gpu-arch=sm_89 ${1}.cu

# Generate binary executable with profiler embedded
llc -march=nvptx64 -mcpu=sm_89 -filetype=asm ${1}-cuda-nvptx64-nvidia-cuda-sm_89.bc -o ${1}.ptx
llc -filetype=obj ${1}.ll -o ${1}.o
clang++ -L/opt/cuda/lib -lcudart ${1}.o ${1}.ptx -o ${1}_prof



# When we run the profiler embedded executable, it generates a default.profraw file that contains the profile data.
./${1}_prof > correct_outputs


# Cleanup: Remove this if you want to retain the created files. And you do need to.
# rm -f default.profraw *_prof *_fplicm *.bc *.profdata *_output *.ll