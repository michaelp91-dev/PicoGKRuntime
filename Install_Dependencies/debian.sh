#!/bin/bash

# install dependencies of PicoGKRuntime
set -e

echo "Starting installation for Raspberry Pi 5..."

# --- 1. SYSTEM DEPENDENCIES ---
# Update and install standard packages (Removed dotnet-sdk from this list)
sudo apt update
sudo apt install -y \
    wget \
    build-essential \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libboost-iostreams-dev \
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
    libicu-dev \
    libgssapi-krb5-2

# --- 2. .NET 8.0 INSTALLATION (Script Method) ---
echo "Installing .NET SDK 8.0 via official install script..."

# Download the official install script
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh

# Install .NET 8.0 to the default location (~/.dotnet)
./dotnet-install.sh --channel 8.0

# Setup Environment Variables for .NET
# This adds the necessary lines to your .bashrc so it works in future terminals
DOTNET_FILE="$HOME/.bashrc"

if ! grep -q "DOTNET_ROOT" "$DOTNET_FILE"; then
    echo "Adding .NET to PATH in $DOTNET_FILE..."
    echo 'export DOTNET_ROOT=$HOME/.dotnet' >> "$DOTNET_FILE"
    echo 'export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools' >> "$DOTNET_FILE"
else
    echo ".NET configuration already exists in $DOTNET_FILE"
fi

# Export for the current session so the rest of the script (or user) can use it immediately
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

rm dotnet-install.sh
echo ".NET 8.0 installed."

# --- 3. CMAKE INSTALLATION ---

# Install cmake 3.27.7 from binary.
required_version="3.27.7"
binary_path="/usr/local/bin/cmake"

version_compare() {
    local req_ver=$1
    local inst_ver=$2
    if [[ "$(printf "%s\n" "$req_ver" "$inst_ver" | sort -V | head -n 1)" == "$req_ver" ]]; then
        return 0
    else
        return 1
    fi
}

# Check existing CMake
if ! command -v cmake &> /dev/null; then
    installed_version="0.0.0"
else
    installed_version=$(cmake --version | grep -oP "(?<=version )(\d+.\d+.\d+)")
fi

version_compare "$required_version" "$installed_version"

if [[ $? -eq 0 ]]; then
    echo "Installed CMake version ($installed_version) is sufficient. Skipping install."
else
    echo "Installed CMake version ($installed_version) is less than $required_version. Installing CMake $required_version."
    
    # Force aarch64 for Raspberry Pi 5
    CMAKE_ARCH="linux-aarch64"
    echo "Downloading CMake for architecture: $CMAKE_ARCH"
    
    wget "https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7-$CMAKE_ARCH.tar.gz"
    tar -xzvf "cmake-3.27.7-$CMAKE_ARCH.tar.gz"
    
    # Clean up previous install if it exists to avoid conflicts
    if [ -d "/opt/cmake-3.27.7" ]; then
        sudo rm -rf /opt/cmake-3.27.7
    fi
    
    sudo mv "cmake-3.27.7-$CMAKE_ARCH" /opt/cmake-3.27.7
    
    # Symlink
    if [ -e "$binary_path" ]; then
        # If a symlink exists, remove it and replace it. If it's a real file, warn user.
        if [ -L "$binary_path" ]; then
            sudo rm "$binary_path"
            sudo ln -s /opt/cmake-3.27.7/bin/cmake $binary_path
            echo "Updated CMake symlink."
        else
            echo "Warning: A file exists at $binary_path that is not a symlink. Please add /opt/cmake-3.27.7/bin to your PATH manually."
        fi
    else
        sudo ln -s /opt/cmake-3.27.7/bin/cmake $binary_path
        echo "CMake linked."
    fi
    
    rm "cmake-3.27.7-$CMAKE_ARCH.tar.gz"
fi

echo "----------------------------------------------------"
echo "Installation Complete!"
echo "IMPORTANT: Please run the following command (or restart your terminal) to use dotnet:"
echo "source ~/.bashrc"
echo "----------------------------------------------------"
exit 0
