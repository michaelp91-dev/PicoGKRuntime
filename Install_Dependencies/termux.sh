#!/bin/bash

# Install dependencies of PicoGKRuntime for Termux

# Update and install essential packages
pkg update -y
pkg upgrade -y

# Function to install a package and handle errors
install_package() {
    local package_name="$1"
    echo "Attempting to install: $package_name"
    pkg install -y "$package_name"
    if [ $? -ne 0 ]; then
        echo "Error: Unable to install package: $package_name"
        return 1  # Indicate failure
    fi
    return 0 # Indicate success
}

# Function to search for a package
search_package() {
    local search_term="$1"
    pkg search "$search_term"
}

# Install necessary packages. Using pkg search to find the correct names.
# Only search if the package hasn't been successfully installed yet.

# libxinerama
if ! install_package libxinerama-dev; then #if install fails, search
  echo "Searching for libxinerama..."
  search_package xinerama
fi

# libxcursor
if ! install_package libxcursor-dev; then #if install fails, search
  echo "Searching for libxcursor..."
  search_package xcursor
fi

# libjemalloc
if ! install_package libjemalloc; then #if install fails, search
  echo "Searching for libjemalloc..."
  search_package malloc
fi

# qt5. Removed, so skip for now.
echo "Searching for qt5-default..."
search_package qt5 # search qt5 instead of qt5-default
#if install_package qt5-default; then :; else echo "Please manually inspect pkg search results and adjust."; fi

# libxkbcommon
if ! install_package libxkbcommon; then #if install fails, search
  echo "Searching for libxkbcommon..."
  search_package bcommon
fi

# These are unlikely to fail because most should already be there but install anyway.
pkg install -y wget make clang libx11 libxrandr libxi libzmq boost openssl pkg-config llvm libtbb libblosc dotnet-sdk-8.0 libwayland libwayland-protocols
