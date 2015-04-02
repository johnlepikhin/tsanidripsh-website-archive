open Gallery

type content =
	| Tag of (Gallery.t * Gallery_make.tag) (* start image + tag *)
	| One of (Gallery.t * string) (* image + title *)

let rexs = [
	(Str.regexp "\\\\"), "\\\\\\\\";
	(Str.regexp "\""), "\\\\\"";
]

let escape s = List.fold_left (fun str (rex, templ) -> Str.global_replace rex templ str) s rexs

let gen_jscall title pos lst =
	try
		let current = List.nth lst pos in
		let lst = List.filter (fun p -> p != current) lst in
		let lst = List.map (fun p -> string_of_int p.id) (current :: lst) |> String.concat "," in
		let title = escape title in
		Printf.sprintf "gallery_view(\"%s\", 0, [%s])" title lst
	with
		| Not_found ->
			let lst = List.filter (fun p -> p.id <> pos) lst in
			let lst = List.map (fun p -> string_of_int p.id) lst |> String.concat "," in
			Printf.eprintf "gallery_static.ml, gen_jscall: pos(=%i) not found in lst(=%s)\n" pos lst;
			exit 1

let gen_jscall_one title p =
	gen_jscall title 0 [p]

let gen_jscall_of_tag ?start tag =
	let lst = filter_by_tag tag in
	let pos =
		match start with
			| None -> 0
			| Some start -> pos_of_id start.id lst
	in
	let title = Tag.to_title tag in
	gen_jscall title pos lst

let jscall_of_content = function
	| Tag (start, tag) -> gen_jscall_of_tag ~start tag
	| One (img, title) -> gen_jscall_one title img
