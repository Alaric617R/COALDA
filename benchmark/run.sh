#!/bin/bash

# ACTION NEEDED: If the path is different, please update it here.
PATH2LIB="../../build/coalpass/CoalPass.so"        # Specify your build directory in the project
PASS=coal

# Delete outputs from previous runs. Update this when you want to retain some files.
rm -f default.profraw *_prof *_fplicm *.bc *.profdata *_output *.ll

# ACTION NEEDED: If the gpu compute capability is different, please update it here
# Convert source code to bitcode (IR).
clang -emit-llvm -c --cuda-gpu-arch=sm_89 ${1}.cu -Xclang -disable-O0-optnone

# Canonicalize natural loops (Ref: llvm.org/doxygen/LoopSimplify_8h_source.html)
opt -passes='loop-simplify' ${1}.bc -o ${1}.ls.bc

# Instrument profiler passes.
opt -passes='pgo-instr-gen,instrprof' ${1}.ls.bc -o ${1}.ls.prof.bc

# Note: We are using the New Pass Manager for these passes! 

# Generate binary executable with profiler embedded
clang -fprofile-instr-generate ${1}.ls.prof.bc -o ${1}_prof

# When we run the profiler embedded executable, it generates a default.profraw file that contains the profile data.
./${1}_prof > correct_output


# Cleanup: Remove this if you want to retain the created files. And you do need to.
rm -f default.profraw *_prof *_fplicm *.bc *.profdata *_output *.ll