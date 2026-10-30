module my_library_interface
  use, intrinsic :: iso_c_binding, only: c_double, c_int
  use my_library, only: normalise_vector
  implicit none

contains

  subroutine normalise_vector_c(v) bind(C, name="normalise_vector")
      real(c_double), intent(inout) :: v(:)

      call normalise_vector(v)

  end subroutine normalise_vector_c

end module my_library_interface
