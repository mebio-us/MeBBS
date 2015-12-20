(* Safely reads a line from stdin. *)
val readline : string -> string option
(* Parses a string into a format more useful for executing system commands. *)
val tokenize : string -> (string * string list) option
(* Executes a command in the (string * string list) notation. *)
val execute : (string * string list) -> unit
(* Executes a command in the (string * string list) notation,
   and also allows a custom environment. *)
val execute_env : (string * string list) -> string list -> unit
