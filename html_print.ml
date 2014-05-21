
module Printer = Html5.P

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
	let r = Str.regexp "[ \t\r\n]+" in
	Str.global_replace r " "

let rec node_filter = function
	| [] -> []
	| hd :: tl ->
		let open Xml in
		match content hd with
			| Empty ->
				empty () :: node_filter tl
			| Comment s ->
				node_filter tl
			| EncodedPCDATA s -> if has_data s then encodedpcdata (remove_spaces s) :: node_filter tl else node_filter tl
			| PCDATA s -> if has_data s then pcdata (remove_spaces s) :: node_filter tl else node_filter tl
			| Entity s -> if has_data s then entity (remove_spaces s) :: node_filter tl else node_filter tl
			| Leaf (name, a) -> leaf ~a name :: node_filter tl
			| Node (name, a, l) ->
				match name with
					| "script" ->
						(node ~a name l) :: node_filter tl
					| _ ->
						let l = node_filter l in
						(node ~a name l) :: node_filter tl

	let compress_doc doc =
	let elt = Html5.M.doc_toelt doc in
	let l = node_filter [elt] in
	match l with
		| [elt] -> Html5.M.tot elt
		| _ -> raise Exit

let to_string doc =
	let out = ref "" in
	let doc = compress_doc doc in
	Printer.print ~output:(fun s -> out := !out ^ s) doc;
	Printf.sprintf "%s\n<!-- Created by %s -->" !out Config.copyright

let elt_to_string elt =
	let out = ref "" in
	Printer.print_list ~output:(fun s -> out := !out ^ s) [elt];
	!out

let print doc =
	let s = to_string doc in
	print_endline s
