open Batteries

let (>>=) = Option.bind

let () =
  let rec main () =
    let cmd = Shell.readline "> " >>= Shell.tokenize in
      match cmd with
        | None     -> main ()
        | Some cmd -> Shell.execute cmd ; main ()
  in main ()
