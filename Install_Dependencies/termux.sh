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

# Install necessary packages.  Using pkg search to find the correct names.
echo "Searching for clang-tools..."
search_package clang-tools
if install_package clang-tools; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for libxinerama..."
search_package libxinerama
if install_package libxinerama; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for libxcursor..."
search_package libxcursor
if install_package libxcursor; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for tbb..."
search_package tbb
if install_package tbb; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for zeromq..."
search_package zeromq
if install_package zeromq; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for jemalloc..."
search_package jemalloc
if install_package jemalloc; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for blosc..."
search_package blosc
if install_package blosc; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for qt5-default..."
search_package qt5-default
if install_package qt5-default; then :; else echo "Please manually inspect pkg search results and adjust."; fi

# Attempt to install dotnet-sdk-7.0. If it fails, check if any dotnet-sdk-* packages exist
echo "Searching for dotnet-sdk-7.0..."
search_package dotnet-sdk-7.0
if ! install_package dotnet-sdk-7.0; then
    echo "dotnet-sdk-7.0 not found.  Searching for alternatives..."
    search_package dotnet-sdk
    echo "Please install an appropriate dotnet-sdk-* package manually based on the search results."
fi

echo "Searching for wayland..."
search_package wayland
if install_package wayland; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for wayland-protocols..."
search_package wayland-protocols
if install_package wayland-protocols; then :; else echo "Please manually inspect pkg search results and adjust."; fi

echo "Searching for libxkbcommon..."
search_package libxkbcommon
if install_package libxkbcommon; then :; else echo "Please manually inspect pkg search results and adjust."; fi

# Basic packages
install_package wget
install_package make
install_package clang
install_package libx11
install_package libxrandr
install_package libxi
install_package boost
install_package openssl
install_package pkg-config
install_package llvm

echo "Dependencies installation attempt complete.  Please review the output for errors and warnings."
