cmake_minimum_required(VERSION 3.16.3)

project(yan_filesystem)

option(BUILD_EXAMPLES "build example" OFF)
option(BUILD_TESTS "build test" ON)

set(CMAKE_CXX_STANDARD 11)
add_compile_options(-fPIC)

if(${BUILD_TESTS} OR ${BUILD_EXAMPLES})
	add_compile_options("-g")
	set(CMAKE_BUILD_TYPE Debug)
else()
	set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
include(yan_key)
include(yan_db)

add_subdirectory(src)

if(${BUILD_TEST})
	include(CTest)
	enable_testing()
	add_subdirectory(test)
endif()