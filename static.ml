
type t = {
	src : Purl.t;
	dst : Purl.t;
}

let files = ref []

let url t =
	Purl.to_string t.dst

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

let css = cmake Path.root "s.css"

let main_background = cmake Path.root "main_background.jpg"

let title = cmake Path.root "title.jpg"

let js_main = cmake Path.root "js_main.js"

let button_close = cmake Path.root "button_close.png"

let favicon = cmake Path.root "favicon.ico"
