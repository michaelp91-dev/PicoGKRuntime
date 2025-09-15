#!/bin/bash

# install dependencies of PicoGKRuntime
set -e

# install apt-add-repository and add dotnet/backtrace repo
sudo apt update
sudo apt install -y software-properties-common 
sudo apt install -y \
    wget \
    build-essential \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libboost-iostreams1.74-dev \
    libtbb-dev \
    libssl-dev \
    libzmq3-dev \
    libjemalloc-dev \
    libblosc-dev \
    doxygen \
    cmake-curses-gui \
    cmake-qt-gui \
    libwayland-dev \
    wayland-protocols \
    pkg-config \
    libxkbcommon-dev \
    clang \
    zlib1g-dev \
    cmake

wget https://builds.dotnet.microsoft.com/dotnet/Sdk/8.0.413/dotnet-sdk-8.0.413-linux-arm64.tar.gz
DOTNET_FILE=dotnet-sdk-8.0.413-linux-arm64.tar.gz
export DOTNET_ROOT=$(pwd)/.dotnet

mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"

export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc    
