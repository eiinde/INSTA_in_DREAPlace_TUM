#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# 1. Clone the repositories
git clone --recursive https://github.com/eiinde/DREAMPlace_TUM.git
git clone https://github.com/eiinde/INSTA_TUM.git

# 2. Check if libgraph_tool_core.so exists and is a valid ELF shared object
if file INSTA_TUM/graph_tool/libgraph_tool_core.so | grep -q "ELF 64-bit LSB shared object"; then
    echo "[INFO] libgraph_tool_core.so is valid."
else
    echo "[INFO] libgraph_tool_core.so is missing or invalid. Installing git-lfs and pulling large files..."
    sudo apt update
    sudo apt install -y git-lfs
    git lfs install
    cd INSTA_TUM
    git lfs pull
    cd ..
fi

# 3. Copy graph_tool directory to Docker build context
mkdir -p docker_graph_tool/graph_tool
cp -r INSTA_TUM/graph_tool/* docker_graph_tool/graph_tool/

# 4. Build Docker image
docker build -t dramplace_insta_tum .

# 5. Run the container
docker run -it --gpus all --name tumplace -v $(pwd):/work dramplace_insta_tum bash


# If the container is already created, you can start it later using:
# docker start -ai tumplace