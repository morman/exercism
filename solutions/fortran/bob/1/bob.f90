module bob
  implicit none
contains

  function hey(statement)
    ! Initialize result 
    character(100) :: hey
    ! Initialize last character in string
    character(1) :: last
    ! Initialize characters in statement via immuntable data flow 
    character(len=*), intent(in) :: statement
    ! Get last character, trimming whitespace
    last = statement(len_trim(statement):len_trim(statement) + 1)
    ! Does the statement end in a question"
    if (last == '?') then
      ! Is the statment yelling: does it have no lower-case and only upper-case?
      if ( scan(statement, 'abcdefghijklmnopqrstuvwxyz') == 0 .and. scan(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZ") > 0 ) then
        hey = 'Calm down, I know what I''m doing!'         
      else
        ! Not yelling
        hey = 'Sure.'
      end if          
    ! Test if text has uppercase and no lower-case characters
    else if (scan(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZ") > 0 .and. scan(statement, 'abcdefghijklmnopqrstuvwxyz') == 0) then
      hey = 'Whoa, chill out!'
    ! Test if trimmed string is empty
    else if (len_trim(statement) == 0) then
      hey = 'Fine. Be that way!'  
    else
      ! default case
      hey = 'Whatever.'
    end if

  end function hey

end module bob
