

%:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" $@

all:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" install.static

with_gallery:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" install.with_gallery
