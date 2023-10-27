#!/bin/bash

# ACTION NEEDED: If the path is different, please update it here.
PATH2LIB="../../build/coalpass/CoalPass.so"        # Specify your build directory in the project
PASS=coal

# Delete outputs from previous runs. Update this when you want to retain some files.
rm -f default.profraw *_prof *_fplicm *.bc *.profdata *_output *.ll

# ACTION NEEDED: If the gpu compute capability is different, please update it here
# Convert source code to bitcode (IR).
clang -emit-llvm -c --cuda-gpu-arch=sm_89 ${1}.cu -Xclang -disable-O0-optnone


# Cleanup: Remove this if you want to retain the created files. And you do need to.
rm -f default.profraw *_prof *_fplicm *.bc *.profdata *_output *.ll