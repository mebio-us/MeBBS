open Batteries

type post = {
  text : string;
  name : string option;
  time : int
}

type thread = {
  first : post;
  posts : post list
}

let make_post ?(name = None) body =
  {
    text = body;
    name = name;
    time = (Int.of_float @@ Unix.time ())
  }

let make_thread ?(name = None) body =
  {
    posts = [];
    first = make_post ~name:name body 
  }

let thread_from_post ps =
  { 
    posts = [];
    first = ps
  }

let write_thread th =
  Marshal.to_string th []

let read_thread ths =
  Marshal.from_string ths 0

let add_post { first = first ; posts = posts } pst =
  { first = first ; posts = posts @ [pst] }
