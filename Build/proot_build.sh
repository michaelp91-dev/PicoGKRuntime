#!/bin/bash

cd PicoGKRuntime
rm -rf build
mkdir build

# Apply the same modifications as your Colab script
sed -i '/project(OpenVDB)/a set(CMAKE_POSITION_INDEPENDENT_CODE ON)' openvdb/CMakeLists.txt
sed -i '/project(OpenVDB)/a set(BUILD_SHARED_LIBS ON)' openvdb/CMakeLists.txt
sed -i 's/OpT::template eval(\([^)]*\))/OpT::eval(\1)/g' openvdb/openvdb/openvdb/tree/NodeManager.h

cd build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DGLFW_BUILD_X11=OFF \
      -DGLFW_BUILD_WAYLAND=OFF \
      -DGLFW_BUILD_OSX=OFF \
      -DGLFW_BUILD_WIN32=OFF \
      -DBoost_USE_STATIC_LIBS=OFF \
      -DBoost_NO_SYSTEM_PATHS=ON \
      -DBOOST_ROOT=$PREFIX \
      ..

make
