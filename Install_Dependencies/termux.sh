#!/bin/bash

# Install dependencies of PicoGKRuntime for Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# setting up x11-repo
pkg install -y x11-repo

# Install packages directly
pkg install -y wget cmake make clang libx11 libxrandr libxi boost openssl pkg-config llvm libtbb libblosc dotnet-sdk-8.0 libwayland libwayland-protocols libzmq libxcursor libxkbcommon libxinerama termux-x11-nightly
pkg install boost boost-headers libtool autoconf automake
echo "Dependencies installation attempt complete."
