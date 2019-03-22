#/bin/bash
command="$CUDA_NVCC_PATH tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC"

echo "\nSampling compliation"
echo "Running cuda nvcc compile step for:"
eval "$command"

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi

echo "Running tensorflow gcc++ compile step:"

# TF1.2
#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I $TENSORFLOW_INCLUDE_PATH -I $CUDA_INCLUDE_PATH -I $TENSORFLOW_NSYNC_PUBLIC_PATH -lcudart -L $CUDA_LIB64_PATH -L $TENSORFLOW_PATH -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
