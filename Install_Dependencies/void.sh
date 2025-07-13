#!/bin/bash

# install dependencies of PicoGKRuntime
set -e

# use xbps for package installation
sudo xbps-install -Sy \
    wget \
    base-devel \
    libX11-devel \
    libXrandr-devel \
    libXinerama-devel \
    libXcursor-devel \
    libXi-devel \
    boost-devel \
    tbb-devel \
    openssl-devel \
    zeromq-devel \
    jemalloc-devel \
    blosc-devel \
    doxygen \
    cmake-gui \
    qt5-devel \
    dotnet-sdk-7.0 \
    wayland-devel \
    wayland-protocols \
    pkg-config \
    libxkbcommon-devel \
    clang

# Install cmake 3.27.7 from binary. The system version is retained.
required_version="3.27.7"
binary_path="/usr/local/bin/cmake"

# Function to compare version numbers
version_compare() {
    local req_ver=$1
    local inst_ver=$2
    if [[ "$(printf "%s\n" "$req_ver" "$inst_ver" | sort -V | head -n 1)" == "$req_ver" ]]; then
        return 0   # version1 is greater or equal to version2
    else
        return 1   # version1 is less than version2
    fi
}

# Get installed CMake version
installed_version=$(cmake --version | grep -oP "(?<=version )(\d+\.\d+\.\d+)")
# Compare versions
version_compare "$required_version" "$installed_version"

# Install CMake if installed version is less than required version
if [[ $? -eq 0 ]]; then
    echo "Installed CMake version ($installed_version) is greater than or equal to $required_version. Installation complete."
    exit 0
else
    echo "Installed CMake version ($installed_version) is less than $required_version. Adding CMake $required_version."
    wget https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7-linux-x86_64.tar.gz
    tar -xzvf cmake-3.27.7-linux-x86_64.tar.gz
    sudo mv cmake-3.27.7-linux-x86_64 /opt/cmake-3.27.7
    # check if cmake is already on the destination path
    if [ -e "$binary_path" ]; then
        echo -e "\033[36mTo Do: A version of cmake already exists at $binary_path. Cmake $required_version was installed at /opt/cmake.3.27.7. To use, add it to your PATH explicitly using the command: \n \n \
            export PATH=/opt/cmake.3.27.7/bin:\$PATH \n\033[0m"
    else
        sudo ln -s /opt/cmake-3.27.7/bin/cmake $binary_path
        echo "CMake $required_version symlinked to $binary_path from location in /opt."
    fi
    rm cmake-3.27.7-linux-x86_64.tar.gz
    echo "Installation complete."
fi
exit 0
