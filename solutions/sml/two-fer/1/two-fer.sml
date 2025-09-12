fun name (input: string option) =
  (* if we have some input, concatenate, otherwise default *)
  case input of 
    SOME name => concat ["One for ", name,  ", one for me."]
  | NONE => "One for you, one for me."


