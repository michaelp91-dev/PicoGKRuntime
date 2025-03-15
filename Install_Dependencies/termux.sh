#!/bin/bash

# Install dependencies of PicoGKRuntime for Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# Function to search for a package
search_package() {
    local search_term="$1"
    pkg search "$search_term"
}

# libxcursor
echo "Searching for xcursor related packages..."
search_package xcursor

# libjemalloc
echo "Searching for jemalloc related packages..."
search_package jemalloc

# libxinerama
echo "Searching for xinerama related packages..."
search_package xinerama

# libxkbcommon
echo "Searching for libxkbcommon related packages..."
search_package libxkbcommon

# Install packages directly
pkg install -y wget make clang libx11 libxrandr libxi boost openssl pkg-config llvm libtbb libblosc dotnet-sdk-8.0 libwayland libwayland-protocols libzmq

echo "Dependencies installation attempt complete. Please review the output for errors and warnings."
