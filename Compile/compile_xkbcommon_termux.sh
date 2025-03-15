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

tar -xf libxkbcommon-$XKBCOMMON_VERSION.tar.gz
cd libxkbcommon-$XKBCOMMON_VERSION

mkdir -p build
cd build

cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DCMAKE_TOOLCHAIN_FILE="${PREFIX}/share/cmake/OEToolchainConfig.cmake" \
    -DCMAKE_BUILD_TYPE=Release \
    -DXKB_COMPOSE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DWITH_XCB=ON \
    -DWITH_X11=ON \
    -DWITH_WAYLAND=ON \ # Enable Wayland support (from Termux script)
    -DWITH_DOCUMENTATION=OFF \
    -Denable-docs=false \ # From Termux script
    -Denable-wayland=true \ # From Termux script
    ..

make -j$(nproc)
make install
