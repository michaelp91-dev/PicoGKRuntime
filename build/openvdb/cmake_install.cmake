# Install script for directory: /content/PicoGKRuntime/openvdb

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/lib/cmake/OpenVDB" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/cmake/FindBlosc.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/FindJemalloc.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/FindLog4cplus.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/FindOpenEXR.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/FindOpenVDB.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/FindTBB.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/OpenVDBGLFW3Setup.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/OpenVDBHoudiniSetup.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/OpenVDBMayaSetup.cmake"
    "/content/PicoGKRuntime/openvdb/cmake/OpenVDBUtils.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/content/PicoGKRuntime/build/openvdb/openvdb/openvdb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/content/PicoGKRuntime/build/openvdb/openvdb_cmd/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/content/PicoGKRuntime/build/openvdb/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
