open Gallery

let rexs = [
	(Str.regexp "\\\\"), "\\\\\\\\";
	(Str.regexp "\""), "\\\\\"";
]

let escape s = List.fold_left (fun str (rex, templ) -> Str.global_replace rex templ str) s rexs

let gen_jscall title pos lst =
	let lst = List.map (fun p -> string_of_int p.id) lst in
	let lst = String.concat "," lst in
	let title = escape title in
	Printf.sprintf "gallery_view(\"%s\", 0, [%s])" title lst

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
