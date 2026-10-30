#include <ISO_Fortran_binding.h>
#include <iostream>

extern "C" void normalise_vector(CFI_cdesc_t *);



int main() {
    double vector[3] = {1.0, 2.0, 3.0};

    CFI_CDESC_T(1) vector_desc;
    CFI_cdesc_t *vector_desc_ptr = (CFI_cdesc_t *)&vector_desc;

    CFI_index_t extents[1] = {3};
    CFI_establish(vector_desc_ptr,
                  &vector, 
                  CFI_attribute_other,
                  CFI_type_double,
                  sizeof(double),
                  1,
                  extents);

    normalise_vector(vector_desc_ptr);


    for (int i = 0; i < 3; ++i) {
        std::cout << vector[i] << " ";
    }
    std::cout << std::endl;

    // Your code here
    return 0;
}
