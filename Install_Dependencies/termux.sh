#!/bin/bash

# Install dependencies of PicoGKRuntime for Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# Install necessary packages. Termux uses pkg instead of apt.
pkg install -y \
    wget \
    make \
    clang \
    clang-tools \
    cmake \ # Install cmake from termux repos. Version check unnecessary as Termux updates regularly
    libx11 \
    libxrandr \
    libxinerama \
    libxcursor \
    libxi \
    boost \  # Installs latest version, adjust as needed. No version specified, so general 'boost' is OK.
    tbb \    # Latest version
    openssl \
    zeromq \ # Latest version
    jemalloc \ # Latest version
    blosc \  # Latest version
    doxygen \
    qt5-default \ # Installs Qt5 libraries and tools.  Equivalent to cmake-qt-gui, and required for building.
    dotnet-sdk-7.0 \ # .NET 7.0.  This may need to be adjusted depending on available Termux packages.  Check with `pkg search dotnet`
    wayland \
    wayland-protocols \
    pkg-config \
    libxkbcommon \
    llvm # Installs LLVM, sometimes required by build tools, clang

echo "Dependencies installation complete"
