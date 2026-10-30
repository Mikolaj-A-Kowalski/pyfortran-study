cmake_minimum_required(VERSION 3.18)
project(pyfortran_study VERSION 0.1.0 LANGUAGES CXX Fortran)

# Language standards for the whole project.
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_Fortran_STANDARD 2018)
set(CMAKE_Fortran_STANDARD_REQUIRED ON)

find_package(Python COMPONENTS Interpreter Development.Module REQUIRED)

# Shared runtime helpers used by every binding example.
add_subdirectory(runtime)

add_subdirectory(examples)

# Examples: each adds a submodule under the pyfortran_study package.
# add_subdirectory(examples/hello)
# add_subdirectory(examples/arrays)
