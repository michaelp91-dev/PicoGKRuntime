#!/bin/bash

# Build libxkbcommon from source in Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# Install build dependencies for libxkbcommon
pkg install -y cmake ninja libxcb libxml2 libwayland xkeyboard-config libwayland-protocols xorg-util-macros

# Build libxkbcommon from source
echo "Attempting to build libxkbcommon from source..."
mkdir -p "$HOME/build"
cd "$HOME/build"

# Download libxkbcommon source
XKBCOMMON_VERSION="1.8.1" # From Termux build script
wget "https://github.com/xkbcommon/libxkbcommon/archive/xkbcommon-$XKBCOMMON_VERSION.tar.gz" -O libxkbcommon-$XKBCOMMON_VERSION.tar.gz

# Extract tarball and handle potential errors
tar -xf libxkbcommon-$XKBCOMMON_VERSION.tar.gz
if [ $? -ne 0 ]; then
    echo "Error: Failed to extract libxkbcommon tarball."
    exit 1
fi

# Correctly identify extracted directory name
EXTRACTED_DIR="libxkbcommon-xkbcommon-$XKBCOMMON_VERSION"  # The ACTUAL extracted directory name

# Debug: Verify directory existence and permissions
echo "Checking if directory '$EXTRACTED_DIR' exists..."
if [ -d "$EXTRACTED_DIR" ]; then
    echo "Directory '$EXTRACTED_DIR' exists."
    echo "Permissions of '$EXTRACTED_DIR':"
    ls -l "$EXTRACTED_DIR"
else
    echo "Error: Directory '$EXTRACTED_DIR' not found."
    exit 1
fi

cd "$EXTRACTED_DIR"

# Debug: Verify that CMakeLists.txt exists
echo "Checking if CMakeLists.txt exists in '$EXTRACTED_DIR'..."
if [ -f "CMakeLists.txt" ]; then
    echo "CMakeLists.txt exists."
    echo "Permissions of CMakeLists.txt:"
    ls -l CMakeLists.txt
else
    echo "Error: CMakeLists.txt not found in '$EXTRACTED_DIR'."
    exit 1
fi

mkdir -p build
cd build

# Simplify CMake command and point to the source directory
cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DCMAKE_TOOLCHAIN_FILE="${PREFIX}/share/cmake/OEToolchainConfig.cmake" \
    -DCMAKE_BUILD_TYPE=Release \
    -DXKB_COMPOSE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DWITH_XCB=ON \
    -DWITH_X11=ON \
    -DWITH_WAYLAND=ON \
    -DWITH_DOCUMENTATION=OFF \
    -Denable-docs=false \
    -Denable-wayland=true \
    "$HOME/build/$EXTRACTED_DIR"

#check cmake exit code
if [ $? -ne 0 ]; then
  echo "Cmake command failed."
  exit 1
fi

make -j$(nproc)
if [ $? -ne 0 ]; then
  echo "Make command failed"
  exit 1
fi

make install
if [ $? -ne 0 ]; then
  echo "Make install failed."
  exit 1
fi
