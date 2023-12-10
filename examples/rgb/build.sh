#!/bin/bash

echo "Attempt to remove old build directory..."
cd ../..
rm -rf build
mkdir build
cd build
cmake ..
make
cd ../examples/rgb
echo "Build finished!"
