#!/bin/bash

cd PicoGKRuntime
mkdir termux_build
sed -i '/project(OpenVDB)/a set(CMAKE_POSITION_INDEPENDENT_CODE ON)' openvdb/CMakeLists.txt
sed -i '/project(OpenVDB)/a set(BUILD_SHARED_LIBS ON)' openvdb/CMakeLists.txt
cd termux_build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/../.. ..
make VERBOSE=1
