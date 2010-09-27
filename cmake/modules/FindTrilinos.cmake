# - Try to find Trilinos
# Once done this will define
#
#  TRILINOS_FOUND        - system has Trilinos
#  TRILINOS_INCLUDE_DIRS - include directories for Trilinos
#  TRILINOS_LIBRARIES    - libraries for Trilinos
#  TRILINOS_DEFINITIONS  - compiler flags for Trilinos

message(STATUS "Checking for package 'Trilinos'")

# Find Trilinos CMake config
find_package(Trilinos PATHS ${TRILINOS_DIR}/include $ENV{TRILINOS_DIR}/include /usr/include/trilinos QUIET)

if (Trilinos_FOUND)

  # Trilinos found
  set(TRILINOS_FOUND true)

  # Get Trilinos include directories
  set(TRILINOS_INCLUDE_DIRS ${Trilinos_INCLUDE_DIRS})

  # Trilinos definitons
  set(TRILINOS_DEFINITIONS)

  # Loop over Trilinos libs and get full path
  foreach (lib ${Trilinos_LIBRARIES})
    find_library(TRILINOS_LIB_${lib} ${lib} PATHS ${Trilinos_LIBRARY_DIRS})
    if (TRILINOS_LIB_${lib} AND NOT ${lib} MATCHES ".*pytrilinos")
      set(TRILINOS_LIBRARIES ${TRILINOS_LIBRARIES} ${TRILINOS_LIB_${lib}})
    endif()
  endforeach()

endif()