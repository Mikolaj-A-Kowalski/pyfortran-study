
add_library(fortranlib STATIC
    library_code.f90
    library_interface.f90
)
set_target_properties(fortranlib PROPERTIES POSITION_INDEPENDENT_CODE ON)


add_executable(toy use.cpp)
target_link_libraries(toy 
    fortranlib
    pyfortran_runtime
)
