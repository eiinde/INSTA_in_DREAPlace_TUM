#!/bin/bash
set -e  # Exit on any error

# Define the OpenROAD directory
OPENROAD_DIR="$HOME/OpenROAD"

# Step 1: Clone the OpenROAD repository with submodules
if [ ! -d "$OPENROAD_DIR" ]; then
    echo "[INFO] Cloning OpenROAD repository..."
    git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git "$OPENROAD_DIR"
else
    echo "[INFO] OpenROAD directory already exists. Skipping clone."
fi

cd "$OPENROAD_DIR"

# Step 2: Install dependencies
echo "[INFO] Installing dependencies (requires sudo)..."
sudo ./etc/DependencyInstaller.sh -all

# Step 3: Build OpenROAD
echo "[INFO] Building OpenROAD..."
./etc/Build.sh

# Step 4: Install OpenROAD (optional)
echo "[INFO] Installing OpenROAD system-wide (requires sudo)..."
sudo make install

echo "[SUCCESS] OpenROAD installation completed."