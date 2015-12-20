open Batteries

let readline prompt =
  Printf.printf "%s" ("[" ^ prompt ^ "]> ") ;
    try Some (read_line ()) with
      | End_of_file -> None

let tokenize str =
  let split = Str.split (Str.regexp " +") str in
    if List.is_empty split then
      None
    else
      Some (List.hd split, List.tl split) 
