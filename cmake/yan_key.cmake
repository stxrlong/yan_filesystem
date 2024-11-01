include(FetchContent)

find_package(yankey CONFIG)
if(NOT yankey_FOUND)
	message(STATUS "cannot find package yankey")
	message(STATUS "create ${CMAKE_CURRENT_SOURCE_DIR}/libs/yan_key")
	FetchContent_Declare(yankey
		GIT_REPOSITORY https://github.com/stxrlong/yan_key.git
		GIT_TAG master
		SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs/yan_key
	)

	FetchContent_MakeAvailable(yankey)

	include_directories(${CMAKE_CURRENT_SOURCE_DIR}/libs/yan_key/src)
else()
	message(STATUS "found package yankey")
endif()

set(yankey_libs yan_key)

list(PREPEND DEPS_LIBS ${yankey_libs})