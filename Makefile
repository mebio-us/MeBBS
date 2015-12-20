all:
	ocamlfind ocamlopt -o main shell.mli shell.ml BBS.mli BBS.ml main.ml -package batteries -linkpkg
	rm {*.cmi,*.cmx,*.o}

debug:
	ocamlfind ocamlopt -o main shell.mli shell.ml BBS.mli BBS.ml main.ml -package batteries -linkpkg -g -p
	rm {*.cmi,*.cmx,*.o}

