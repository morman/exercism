module hamming
  implicit none
contains

  function compute(strand1, strand2, distance)
      character(*) :: strand1, strand2
      integer :: distance
      integer :: position
      logical :: compute
      ! Initialize distance
      distance = 0
      ! Initialize compute
      compute = .true.
      ! Test for unequal length and return false
      if (len(strand1) /= len(strand2)) then
        compute = .false.
      else 
      ! Loop over length and compare characters at position
        do position=1, len(strand1) 
          if (strand1(position:position) /= strand2(position:position)) then
            ! Different bases, so increment counter
            distance = distance + 1
          end if
        end do
      end if

  end function compute

end module hamming
