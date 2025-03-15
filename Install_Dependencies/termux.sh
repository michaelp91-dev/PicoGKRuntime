#!/bin/bash

# Install dependencies of PicoGKRuntime for Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# Install necessary packages. Termux uses pkg instead of apt.
pkg install -y wget make clang clang-tools cmake libx11 libxrandr libxinerama libxcursor libxi boost tbb openssl zeromq jemalloc blosc doxygen qt5-default dotnet-sdk-7.0 wayland wayland-protocols pkg-config libxkbcommon llvm 

echo "Dependencies installation complete"
