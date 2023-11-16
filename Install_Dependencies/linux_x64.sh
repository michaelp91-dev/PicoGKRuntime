#!/bin/bash

# install dependencies of PicoGKRuntime

# use apt for most packages
sudo apt update
sudo apt install \
    wget build-essential \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libboost-all-dev \
    libtbb-dev \
    libssl-dev \
    libzmq3-dev \
    libjemalloc-dev \
    doxygen \
    cmake-curses-gui \
    cmake-qt-gui \
    dotnet-sdk-7.0 \
    clang

# install c-blosc from source
git clone https://github.com/Blosc/c-blosc.git
cd c-blosc
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX='/usr/local' ..
cmake --build .
sudo cmake --build . --target install
cd ../../ && rm -rf c-blosc

# install cmake from binary to acces cmake 3.27.7
# the system version is retained
# 3.27.7 is made available on the PATH /usr/local/bin/cmake
wget https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7-linux-x86_64.tar.gz
tar -xzvf cmake-3.27.7-linux-x86_64.tar.gz && \
sudo mv cmake-3.27.7-linux-x86_64 /opt/cmake-3.27.7 && \
sudo ln -s /opt/cmake-3.27.7/bin/cmake /usr/local/bin/cmake && \
rm cmake-3.27.7-linux-x86_64.tar.gz