message( "this hostconfig assumes you are using homebrew")
message( "brew install bison cmake gcc git-lfs open-mpi openblas python3")

message( "CMAKE_SYSTEM_PROCESSOR = ${CMAKE_SYSTEM_PROCESSOR}" )
message("CONFIG_NAME = ${CONFIG_NAME}")

# set paths to C, C++, and Fortran compilers. Note that while GEOS does not contain any Fortran code,
# some of the third-party libraries do contain Fortran code. Thus a Fortran compiler must be specified.
set(CMAKE_C_COMPILER "/usr/bin/clang" CACHE PATH "")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++" CACHE PATH "")
set(CMAKE_Fortran_COMPILER "${HOMEBREW_DIR}/bin/gfortran" CACHE PATH "")
set(ENABLE_FORTRAN ON CACHE BOOL "" FORCE)

# enable MPI and set paths to compilers and excutable.
# Note that the MPI compilers are wrappers around standard serial compilers.
# Therefore, the MPI compilers must wrap the appropriate serial compilers specified
# in CMAKE_C_COMPILER, CMAKE_CXX_COMPILER, and CMAKE_Fortran_COMPILER

# set(ENABLE_MPI ON CACHE PATH "")
set(ENABLE_MPI ON CACHE BOOL "" FORCE)
set(MPI_C_COMPILER "${HOMEBREW_DIR}/bin/mpicc" CACHE PATH "")
set(MPI_CXX_COMPILER "${HOMEBREW_DIR}/bin/mpicxx" CACHE PATH "")
set(MPI_Fortran_COMPILER "${HOMEBREW_DIR}/bin/mpifort" CACHE PATH "")
set(MPIEXEC "${HOMEBREW_DIR}/bin/mpirun" CACHE PATH "")

# enable tests
set(ENABLE_GTEST_DEATH_TESTS ON CACHE BOOL "" FORCE)

# enable PVTPackage
set(ENABLE_PVTPackage ON CACHE BOOL "" FORCE)

# disable CUDA and OpenMP
set(ENABLE_CUDA "OFF" CACHE PATH "" FORCE)
set(ENABLE_OPENMP "OFF" CACHE PATH "" FORCE)

# disable CALIPER
set(ENABLE_CALIPER "OFF" CACHE PATH "" FORCE )

set( BLAS_LIBRARIES ${HOMEBREW_DIR}/Cellar/openblas/0.3.24/lib/libblas.dylib CACHE PATH "" FORCE )
set( LAPACK_LIBRARIES ${HOMEBREW_DIR}/Cellar/openblas/0.3.24/lib/liblapack.dylib CACHE PATH "" FORCE )

set(ENABLE_DOXYGEN OFF CACHE BOOL "" FORCE)
set(ENABLE_MATHPRESSO OFF CACHE BOOL "" FORCE )
set(GEOSX_BUILD_OBJ_LIBS OFF CACHE BOOL "" FORCE)


#set( DOXYGEN_EXECUTABLE ${HOMEBREW_DIR}/bin/doxygen CACHE PATH "" FORCE )
#set( SPHINX_EXECUTABLE ${HOMEBREW_DIR}/bin/sphinx-build CACHE PATH "" FORCE )

if(NOT ( EXISTS "${GEOSX_TPL_DIR}" AND IS_DIRECTORY "${GEOSX_TPL_DIR}" ) )
   set(GEOSX_TPL_DIR "${CMAKE_SOURCE_DIR}/../../thirdPartyLibs/install-${CONFIG_NAME}-release" CACHE PATH "" FORCE )
endif()

# ATS
set(ATS_ARGUMENTS "--machine openmpi --ats openmpi_mpirun=${MPIEXEC}"  CACHE PATH "")

include(${CMAKE_CURRENT_LIST_DIR}/../tpls.cmake)
