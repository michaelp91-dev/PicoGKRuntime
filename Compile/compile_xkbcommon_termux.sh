#!/bin/bash

# Build libxkbcommon from source in Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# Install build dependencies for libxkbcommon
pkg install -y build-essential libxcb libxml2 libwayland xkeyboard-config libwayland-protocols xorg-util-macros meson

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
if [ ! -d "$EXTRACTED_DIR" ]; then
    echo "Error: Extracted directory '$EXTRACTED_DIR' not found."
    exit 1
fi

cd "$EXTRACTED_DIR"

# Build with meson
mkdir -p build
cd build

# Configure with meson
meson setup -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" -Denable-docs=false -Denable-wayland=true ..

# Check meson setup exit code
if [ $? -ne 0 ]; then
    echo "Meson setup failed."
    exit 1
fi

# Build with meson
meson compile -j$(nproc)

# Check meson compile exit code
if [ $? -ne 0 ]; then
    echo "Meson compile failed."
    exit 1
fi

# Install with meson
meson install

# Check meson install exit code
if [ $? -ne 0 ]; then
    echo "Meson install failed."
    exit 1
fi
