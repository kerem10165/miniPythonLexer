cmake_minimum_required(VERSION 3.14)

project(miniPythonLexer CXX)

set(CMAKE_CXX_FLAGS "-O3 -Wall -W -pedantic")
set (CMAKE_CXX_STANDARD 17)

add_subdirectory(src)



add_executable(${PROJECT_NAME} main.cpp magic_enum/magic_enum.hpp)

target_include_directories(${PROJECT_NAME} PRIVATE magic_enum)
target_link_libraries(${PROJECT_NAME} parser)

file(COPY test DESTINATION ${PROJECT_BINARY_DIR})
file(COPY magic_enum DESTINATION ${PROJECT_BINARY_DIR})