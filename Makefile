

%:
	ocamlbuild -j 4 -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" $@

all:
	ocamlbuild -j 4 -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" install.static

with_gallery:
	ocamlbuild -j 4 -use-ocamlfind -plugin-tag "package(js_of_ocaml-ocamlbuild)" install.with_gallery

deploy: with_gallery
	rsync -av /tmp/tsandripsh/ lepikhin:/var/www/tsandripsh/data/www/tsandripsh-hotel.ru/
