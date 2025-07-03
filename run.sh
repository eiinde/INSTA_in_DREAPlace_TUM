#!/bin/bash
set -e  # Exit on any error

# 1. Navigate to the DREAMPlace_TUM directory
cd /work/DREAMPlace_TUM/install

python dreamplace/Placer.py params_insta.json

