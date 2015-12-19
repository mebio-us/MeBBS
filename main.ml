module Main : sig 
  val read_post : unit -> BBS.post 
end = struct
  let read_post () =
    let body = Printf.printf "> " ; read_line () in
      BBS.make_post body
end

let () =
  let post = Main.read_post () in
    Printf.printf "%s\n" @@ BBS.write_thread @@ BBS.thread_from_post post 
