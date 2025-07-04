#!/bin/bash
set -e  # Exit on any error

# 1. Navigate to the DREAMPlace_TUM directory
cd /work/DREAMPlace_TUM

# 2. Install Python requirements in DREAMPlace
pip install -r requirements.txt

# 3. Build DREAMPlace_TUM
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install -DPython_EXECUTABLE=$(which python)
make -j$(nproc)
make install

# 4. Copy INSTA_TUM into the install directory
cp -r /work/INSTA_TUM /work/DREAMPlace_TUM/install/thirdparty/
