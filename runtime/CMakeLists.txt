add_library(pyfortran_runtime OBJECT
    src/runtime.cpp
)

# Object libraries are linked into Python extension modules (shared
# objects), so the objects must be position-independent.
set_target_properties(pyfortran_runtime PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_include_directories(pyfortran_runtime PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
target_compile_features(pyfortran_runtime PUBLIC cxx_std_20)
