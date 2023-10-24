#!/bin/bash

rm *.bc *.ll
clang++ -stdlib=libc++ -emit-llvm -c rgb.cu -Xclang -disable-O0-optnone
llvm-dis *.bc
