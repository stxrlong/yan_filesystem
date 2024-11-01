include(FetchContent)

find_package(yandb CONFIG)
if(NOT yandb_FOUND)
	message(STATUS "cannot find package yandb")
	FetchContent_Declare(yandb
		GIT_REPOSITORY https://github.com/stxrlong/yan_db.git
		GIT_TAG master
		SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs/yan_db
	)

	FetchContent_MakeAvailable(yandb)

	include_directories(${CMAKE_CURRENT_SOURCE_DIR}/libs/yan_db/src)
else()
	message(STATUS "found package yandb")
endif()

set(yandb_libs yan_db)

list(PREPEND DEPS_LIBS ${yandb_libs})