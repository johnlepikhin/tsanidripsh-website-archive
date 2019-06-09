

%:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" $@

all:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" install.static

with_gallery:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" install.with_gallery

deploy: with_gallery
	rsync -av /tmp/tsandripsh/ lepikhin:/var/www/tsandripsh/data/www/tsandripsh-hotel.ru/
