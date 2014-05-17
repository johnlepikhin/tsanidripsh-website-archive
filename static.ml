
type t = {
	src : Purl.t;
	dst : Purl.t;
}

let files = ref []

let url t =
	Purl.to_string t.dst

let src_full_path p = Printf.sprintf "%s%s" Config.static_path (Purl.to_string p)

let dst_full_path p = Printf.sprintf "%s%s" Config.save_path (Purl.to_string p)

let make psrc fsrc pdst fdst =
	let src = psrc, fsrc in
	let dst = pdst, fdst in
	try
		let _ = List.find (fun t -> t.dst = dst) !files in
		raise (failwith (Printf.sprintf "Static file with destination '%s' registered twice" (Purl.to_string dst)))
	with
		| Not_found ->
			let t = { src; dst} in
			files := t :: !files;
			t

let smake psrc pdst file = make psrc file pdst file

let cmake p file = smake p p file

let umake (path, file) = cmake path file

let create_all () =
	let f t =
		let src_full = src_full_path t.src in
		let dst_full = dst_full_path t.dst in
		if not (Sys.file_exists src_full) then
			raise (failwith (Printf.sprintf "Static file '%s' not found" src_full));
		let _ = Sys.command (Printf.sprintf "cp '%s' '%s' && chmod 644 '%s'" src_full dst_full dst_full) in
		()
	in
	List.iter f !files

let css = cmake Path.root "s.css"

let main_background = cmake Path.root "main_background.jpg"

let title = cmake Path.root "title.jpg"

let js_main = cmake Path.root "js_main.js"
