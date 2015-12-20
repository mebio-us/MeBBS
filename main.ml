let () =
  Printf.printf "%s\n" @@
    match Shell.readline "BODY" with
      | None   -> "No input given."
      | Some x -> x
