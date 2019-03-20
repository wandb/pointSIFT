export TENSORFLOW_PATH="/home/nbardy/mlprojects/pointSIFT/venv/lib/python3.5/site-packages/tensorflow"
export TENSORFLOW_INCLUDE_PATH="$TENSORFLOW_PATH/include"
export TENSORFLOW_NSYNC_PUBLIC_PATH="$TENSORFLOW_PATH/include/external/nsync/public"
export CUDA_PATH="/usr/local/cuda-10.0"
export CUDA_NVCC_PATH="$CUDA_PATH/bin/nvcc"
export CUDA_INCLUDE_PATH="$CUDA_PATH/include"
export CUDA_LIB64_PATH="$CUDA_PATH/lib64/"

(cd tf_utils/tf_ops/sampling; sh tf_sampling_compile.sh)
(cd tf_utils/tf_ops/grouping; sh tf_grouping_compile.sh)
(cd tf_utils/tf_ops/interpolation; sh tf_interpolate_compile.sh)
(cd tf_utils/tf_ops/pointSIFT_op; sh tf_pointSIFT_compile.sh)
