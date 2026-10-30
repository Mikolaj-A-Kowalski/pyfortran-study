module my_library
  use, intrinsic :: iso_fortran_env, only: real64

  implicit none

  integer, parameter :: wp = real64


contains

  subroutine normalise_vector(v)
    real(wp), intent(inout) :: v(:)

    v = v / sum(v)

  end subroutine normalise_vector

end module my_library
