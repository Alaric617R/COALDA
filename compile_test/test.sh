clang++ test.cu -o test.out --cuda-gpu-arch=sm_89 -L/opt/cuda/lib -lcudart_static -ldl -lrt -pthread -Xarch_device -fpass-plugin=../build/coalpass/CoalPass.so
clang++ --cuda-gpu-arch=sm_89 -emit-llvm -c test.cu -Xclang -disable-O0-optnone -Xarch_device -fpass-plugin=../build/coalpass/CoalPass.so
