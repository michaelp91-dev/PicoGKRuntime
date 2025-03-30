#!/bin/bash

cd PicoGKRuntime
rm -r build
mkdir build
sed -i '/project(OpenVDB)/a set(CMAKE_POSITION_INDEPENDENT_CODE ON)' openvdb/CMakeLists.txt
sed -i '/project(OpenVDB)/a set(BUILD_SHARED_LIBS ON)' openvdb/CMakeLists.txt
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/../.. ..
make
