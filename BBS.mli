(* Simple post type, it has three fields:
   - text: post body
   - name (optional): name of poster (if given)
   - time: unix timestamp of when the post was made
*)

type post = {
  text : string;
  name : string option;
  time : int
}

(* Simple thread type.
   Composed of an "OP" post (first) and 
   a list of posts within the thread.
*)

type thread = {
  first : post;
  posts : post list
}

(* Creates a post from a name (optional) and body. *)
val make_post   : ?name:string option -> string -> post
(* Creates a new thread from a name (optional) and body. *)
val make_thread : ?name:string option -> string -> thread
(* Constructs a new thread from a post. *)
val thread_from_post : post -> thread
(* Marshals a thread. Purely for convenience. *)
val write_thread : thread -> string
(* Unmarshals a thread. *)
val read_thread : string -> thread
(* Adds a given post to the end of a thread. *)
val add_post : thread -> post -> thread
