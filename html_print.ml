
module Printer = Tyxml_html

let has_data s =
	let len = String.length s in
	let rec loop pos =
		if pos = len then
			false
		else
			match s.[pos] with
				| ' '
				| '\t'
				| '\n'
				| '\r' -> loop (pos+1)
				| _ -> true
	in
	loop 0

let remove_spaces =
	let r = Str.regexp "[ \t]+" in
	Str.global_replace r " "

let rec node_filter = function
	| [] -> []
	| hd :: tl ->
		let open Tyxml.Xml in
		match content hd with
			| Empty ->
				empty () :: node_filter tl
			| Comment s ->
				node_filter tl
			| EncodedPCDATA s ->
				encodedpcdata (if has_data s then remove_spaces s else " ") :: node_filter tl
			| PCDATA s -> pcdata (if has_data s then remove_spaces s else " ") :: node_filter tl
			| Entity s -> entity (if has_data s then remove_spaces s else " ") :: node_filter tl
			| Leaf (name, a) -> leaf ~a name :: node_filter tl
			| Node (name, a, l) ->
				match name with
					| "script" ->
						(node ~a name l) :: node_filter tl
					| _ ->
						let l = node_filter l in
						(node ~a name l) :: node_filter tl

	let compress_doc doc =
	let elt = Tyxml.Html.doc_toelt doc in
	let l = node_filter [elt] in
	match l with
		| [elt] -> Tyxml.Html.tot elt
		| _ -> raise Exit

let to_string doc =
	let out = ref "" in
	let doc = compress_doc doc in
	let s = Format.asprintf "%a" (Tyxml.Html.pp ()) doc in
	s ^ (Printf.sprintf "%s\n<!-- Created by %s -->" !out Config.copyright)

let elt_to_string elt =
	Format.asprintf "%a" (Tyxml.Html.pp_elt ()) elt

let print doc =
	let s = to_string doc in
	print_endline s
