# Install script for directory: /content/PicoGKRuntime/openvdb/openvdb/openvdb

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/lib" TYPE STATIC_LIBRARY FILES "/content/PicoGKRuntime/build/Lib/libopenvdb.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/usr/lib/libopenvdb.so.11.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/usr/lib/libopenvdb.so.11.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "//usr/lib:/usr/local/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/lib" TYPE SHARED_LIBRARY FILES
    "/content/PicoGKRuntime/build/openvdb/openvdb/openvdb/libopenvdb.so.11.0.1"
    "/content/PicoGKRuntime/build/openvdb/openvdb/openvdb/libopenvdb.so.11.0"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/usr/lib/libopenvdb.so.11.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/usr/lib/libopenvdb.so.11.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/usr/local/lib::::::::::"
           NEW_RPATH "//usr/lib:/usr/local/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/lib" TYPE SHARED_LIBRARY FILES "/content/PicoGKRuntime/build/openvdb/openvdb/openvdb/libopenvdb.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/Exceptions.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/Grid.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/Metadata.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/MetaMap.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/openvdb.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/Platform.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/PlatformConfig.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/Types.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/TypeList.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb" TYPE FILE FILES "/content/PicoGKRuntime/build/openvdb/openvdb/openvdb/openvdb/version.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/io" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/Archive.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/Compression.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/DelayedLoadMetadata.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/File.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/GridDescriptor.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/io.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/Queue.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/Stream.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/io/TempFile.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/math" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/BBox.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/ConjGradient.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Coord.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/DDA.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/FiniteDifference.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Half.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/LegacyFrustum.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Maps.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Mat.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Mat3.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Mat4.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Math.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Operators.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Proximity.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/QuantizedUnitVec.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Quat.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Ray.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Stats.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Stencils.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Transform.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Tuple.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Vec2.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Vec3.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/math/Vec4.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/points" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/AttributeArray.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/AttributeArrayString.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/AttributeGroup.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/AttributeSet.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/IndexFilter.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/IndexIterator.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointAdvect.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointAttribute.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointConversion.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointCount.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointDataGrid.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointDelete.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointGroup.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointMask.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointMove.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointRasterizeFrustum.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointRasterizeSDF.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointRasterizeTrilinear.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointSample.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointScatter.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointStatistics.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/PointTransfer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/StreamCompression.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/points/impl" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointAttributeImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointConversionImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointCountImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointDeleteImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointGroupImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointMaskImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointMoveImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointRasterizeFrustumImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointRasterizeSDFImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointRasterizeTrilinearImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointReplicateImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointSampleImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointScatterImpl.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/points/impl/PointStatisticsImpl.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/tools" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Activate.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/ChangeBackground.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Clip.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Composite.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Count.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Dense.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/DenseSparseTools.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Diagnostics.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/FastSweeping.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Filter.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/FindActiveValues.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/GridOperators.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/GridTransformer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Interpolation.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetAdvect.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetFilter.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetFracture.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetMeasure.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetMorph.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetPlatonic.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetRebuild.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetSphere.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetTracker.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/LevelSetUtil.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Mask.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Merge.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/MeshToVolume.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Morphology.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/MultiResGrid.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/NodeVisitor.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/ParticleAtlas.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/ParticlesToLevelSet.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PointAdvect.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PointIndexGrid.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PointPartitioner.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PointScatter.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PointsToMask.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PoissonSolver.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/PotentialFlow.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Prune.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/RayIntersector.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/RayTracer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/SignedFloodFill.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/Statistics.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/TopologyToLevelSet.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/ValueTransformer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/VectorTransformer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/VelocityFields.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/VolumeAdvect.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/VolumeToMesh.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tools/VolumeToSpheres.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/tree" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/InternalNode.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/Iterator.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/LeafBuffer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/LeafManager.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/LeafNode.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/LeafNodeBool.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/LeafNodeMask.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/NodeManager.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/NodeUnion.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/RootNode.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/Tree.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/TreeIterator.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/tree/ValueAccessor.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/util" TYPE FILE FILES
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/Assert.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/CpuTimer.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/ExplicitInstantiation.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/Formats.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/logging.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/MapsUtil.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/Name.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/NodeMasks.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/NullInterrupter.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/PagedArray.h"
    "/content/PicoGKRuntime/openvdb/openvdb/openvdb/util/Util.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/usr/include/openvdb/thread" TYPE FILE FILES "/content/PicoGKRuntime/openvdb/openvdb/openvdb/thread/Threading.h")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/content/PicoGKRuntime/build/openvdb/openvdb/openvdb/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
