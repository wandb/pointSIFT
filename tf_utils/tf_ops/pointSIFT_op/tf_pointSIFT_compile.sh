#/bin/bash
command="$CUDA_NVCC_PATH pointSIFT.cu -o pointSIFT.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC"

echo "\nPointSIFT compliation"
echo "Running cuda nvcc compile step for:"
eval "$command"

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi



# TF1.4
g++ -std=c++11 main.cpp pointSIFT.cu.o -o tf_interpolate_so.so -shared -fPIC -I $TENSORFLOW_INCLUDE_PATH -I $CUDA_INCLUDE_PATH -I $TENSORFLOW_NSYNC_PUBLIC_PATH -lcudart -L $CUDA_LIB64_PATH -L$TENSORFLOW_PATH -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
