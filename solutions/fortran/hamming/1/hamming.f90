module hamming
  ! Hamming distance module
  !
  ! Provides a function `compute` that calculates the Hamming distance between two DNA strands.
  ! Contract:
  ! - Returns .true. and sets `distance` to the number of differing positions when the inputs
  !   are of equal length.
  ! - Returns .false. when inputs are of unequal length; `distance` remains 0 in this case.
  ! Notes:
  ! - This implementation compares characters as-is; it does not normalize case or validate
  !   that inputs are restricted to A/C/G/T. See TASKS.md for potential extensions.
  implicit none
contains

  pure function compute(strand1, strand2, distance) result(success)
      ! Compute the Hamming distance between two equal-length strings.
      ! Inputs must be the same length; otherwise, return .false. and leave distance=0.
      character(*), intent(in)  :: strand1, strand2
      integer,      intent(out) :: distance
      logical                    :: success
      integer                    :: position
      integer                    :: n

      ! Initialize outputs
      distance = 0
      success  = .true.

      ! Test for unequal length and return false
      if (len(strand1) /= len(strand2)) then
        success = .false.
        return
      end if

      ! Loop over length and compare characters at position
      n = len(strand1)
      do position = 1, n
        if (strand1(position:position) /= strand2(position:position)) then
          ! Different bases, so increment counter
          distance = distance + 1
        end if
      end do

  end function compute

end module hamming
