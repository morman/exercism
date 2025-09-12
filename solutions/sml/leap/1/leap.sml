fun isLeapYear year =
  (*  modulo divide year by four cases: 400, 100, 4, and default *)
  case(year mod 400, year mod 100, year mod 4) of 
  (0, _, _) => true 
  | (_, 0, _) => false
  | (_, _, 0) => true
  | _ => false 

