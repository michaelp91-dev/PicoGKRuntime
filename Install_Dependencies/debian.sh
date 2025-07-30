#!/bin/bash

# install dependencies of PicoGKRuntime
set -e
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt update
sudo apt install -y dotnet-sdk-8.0

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
    zlib1g-dev

wget https://github.com/Kitware/CMake/releases/download/v4.1.0-rc3/cmake-4.1.0-rc3-linux-x86_64.tar.gz
sudo mkdir -p /opt/cmake
sudo tar -xzf cmake-4.1.0-rc3-linux-x86_64.tar.gz -C /opt/cmake --strip-components=1
echo 'export PATH="/opt/cmake/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
