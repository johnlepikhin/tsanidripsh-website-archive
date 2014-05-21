
let binary = "tsandripsh.native"

open Ocamlbuild_plugin

let cmd_copy file dest =
	let open Command in
	Cmd (S[A"cp"; P file; P dest])

let rule_cp ~prod file dest =
	rule (Printf.sprintf "Copy %s" file) ~prod ~dep:file (fun env builder -> cmd_copy (Pathname.mk file) (Pathname.mk dest))

let dispatcher hook =
	begin
		match hook with
			| After_rules ->
				(* JS *)
				rule_cp ~prod:"copy.js.main_js" "js_main.js" "../static/";

				(* Gallery *)
				rule "Generate gallery_info.ml" ~prods:["generate.gallery_info"; "gallery_info.ml"] (fun env builder ->
					Cmd (A "../make_galleryinfo")
				);

				(* CSS *)
				rule "Generate uncompressed.s.css" ~prod:"uncompressed.css.s" ~dep:"source.s.css" (fun env builder ->
					Cmd (S[A"sh"; A"-c"; A"ccss <source.s.css > uncompressed.s.css"])
				);

				rule "Generate s.css" ~prod:"s.css" ~dep:"uncompressed.css.s" (fun env builder ->
					Cmd (S[A"yui-compressor"; A"--type=css"; A"-o"; A"s.css"; A"uncompressed.s.css"])
				);

				rule_cp ~prod:"copy.css.s" "s.css" "../static/";

				(* Install *)
				let install_deps = ["generate.gallery_info"; "copy.js.main_js"; "copy.css.s"; binary] in

				let cmd_install args env builder =
					let open Command in
					let binary = "../" ^ binary in
					let args = List.map (fun a -> A a) args in
					Cmd (S(A binary :: args))
				in

				rule "Install static" ~prod:"install.static" ~deps:install_deps (cmd_install []);

				rule "Install with gallery" ~prod:"install.with_gallery" ~deps:install_deps (cmd_install ["gallery"]);
			| _ -> ()
	end;
	Ocamlbuild_js_of_ocaml.dispatcher hook

let _ = Ocamlbuild_plugin.dispatch dispatcher
