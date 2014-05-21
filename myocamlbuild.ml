
let binary = "tsandripsh.native"

open Ocamlbuild_plugin

let cmd_copy file dest =
	let open Command in
	Cmd (S[A"cp"; P file; P dest])

let rule_cp name ~prod file dest =
	rule name ~prod ~dep:file (fun env builder -> cmd_copy (Pathname.mk file) (Pathname.mk dest))

let dispatcher hook =
	begin
		match hook with
			| After_rules ->
				rule_cp "Copy JS" ~prod:"copy.js_main" "js_main.js" "../static/";

				rule "Generate gallery_info.ml" ~prods:["generate.gallery_info"; "gallery_info.ml"] (fun env builder ->
					Cmd (A "../make_galleryinfo")
				);

				rule "Generate s.css" ~prods:["generate.css"; "s.css"] ~dep:"source.s.css" (fun env builder ->
					Cmd (S[A"sh"; A"-c"; A"ccss <source.s.css > s.css.uncompressed && yui-compressor --type=css < s.css.uncompressed > s.css"])
				);
				rule_cp "Copy CSS" ~prod:"copy.css" "s.css" "../static/";

				rule "Install static" ~prod:"install.static" ~deps:["generate.gallery_info"; "copy.js_main"; "copy.css"; binary] (fun env builder ->
					let open Command in
					let binary = "../" ^ binary in
					Cmd (A binary)
				);

				rule "Install with gallery" ~prod:"install.with_gallery" ~deps:["generate.gallery_info"; "copy.js_main"; "copy.css"; binary] (fun env builder ->
					let open Command in
					let binary = "../" ^ binary in
					Cmd (S[A binary; A "gallery"])
				);
			| _ -> ()
	end;
	Ocamlbuild_js_of_ocaml.dispatcher hook

let _ = Ocamlbuild_plugin.dispatch dispatcher
