include(${CMAKE_CURRENT_LIST_DIR}/../src/coreComponents/cxx-utilities/host-configs/lassen-clang@upstream.cmake)

# asmjit doesn't work on PowerPC
set(ENABLE_MATHPRESSO OFF CACHE BOOL "")

# Silo configure script doesn't recognize systype
set(SILO_BUILD_TYPE powerpc64-unknown-linux-gnu CACHE STRING "")

set(ENABLE_PAMELA ON CACHE BOOL "")
set(ENABLE_PVTPackage ON CACHE BOOL "")

set(ENABLE_CALIPER ON CACHE BOOL "")
set(ENABLE_PAPI OFF CACHE BOOL "")

set(ENABLE_ESSL ON CACHE BOOL "")
set(ESSL_INCLUDE_DIRS /usr/tcetmp/packages/essl/essl-6.2/include CACHE STRING "")
set(ESSL_LIBRARIES /usr/tcetmp/packages/essl/essl-6.2/lib64/libesslsmpcuda.so
                   /usr/tce/packages/xl/xl-beta-2019.06.20/alllibs/libxlsmp.so
                   /usr/tce/packages/xl/xl-beta-2019.06.20/alllibs/libxlfmath.so
                   /usr/tce/packages/xl/xl-beta-2019.06.20/alllibs/libxlf90_r.so
                   /usr/tce/packages/xl/xl-beta-2019.06.20/alllibs/libxlopt.a
                   /usr/tce/packages/xl/xl-beta-2019.06.20/alllibs/libxl.a
                   ${CUDA_TOOLKIT_ROOT_DIR}/lib64/libcudart.so
                   /g/g14/corbett5/workspace/geosx/thirdPartyLibs/scripts/liblapackforessl.a
                   CACHE PATH "")
