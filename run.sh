#!/bin/bash
set -e  # Exit on any error

# 1. Navigate to the DREAMPlace_TUM install directory
cd /work/DREAMPlace_TUM/install || { echo "Directory not found!"; exit 1; }

# 2. Run placement using INSTA configuration
python dreamplace/Placer.py params_insta.json

