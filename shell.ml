open Batteries

let readline prompt =
  Printf.printf "%s" prompt ;
    try Some (read_line ()) with
      | End_of_file -> None

let tokenize str =
  let split = Str.split (Str.regexp " +") str in
    if List.is_empty split then
      None
    else
      Some (List.hd split, split) 

let execute set =
  let pid = Unix.fork () in
    if pid == 0 then
      match set with
        | (cmd, [c])  -> Unix.execvp cmd [|c|]
        | (cmd, args) -> Unix.execvp cmd @@ Array.of_list args
    else
      Unix.waitpid [Unix.WUNTRACED] pid |> ignore 

let execute_env set env =
  let pid = Unix.fork () in
    if pid == 0 then
      match set with
        | (cmd, [c])  -> Unix.execvpe cmd [|c|] (Array.of_list env)
        | (cmd, args) -> Unix.execvpe cmd (Array.of_list args) (Array.of_list env)
    else
      Unix.waitpid [Unix.WUNTRACED] pid |> ignore
