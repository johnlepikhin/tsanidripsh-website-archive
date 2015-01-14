
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


let sitemap = cmake Path.root "sitemap.xml"

let google_verify = cmake Path.root "google315ff116e4d934b7.html"

let css = cmake Path.root "s.css"

let main_background = cmake Path.root "main_background.jpg"

let title = cmake Path.root "title.jpg"

let title_new_year = cmake Path.root "title_new_year.png"

let js_main = cmake Path.root "js_main.js"

let button_close = cmake Path.root "button_close.png"

let favicon = cmake Path.root "favicon.ico"

let robots = cmake Path.root "robots.txt"

let arrow_left = cmake Path.root "arrow_left.png"

let arrow_right = cmake Path.root "arrow_right.png"

let christmas_tree = cmake Path.root "christmas_tree.svg"
let yacht = cmake Path.root "yacht.svg"
let sea = cmake Path.root "sea.svg"
let orange = cmake Path.root "orange.svg"

let internet_instruction_billing = cmake Path.root "internet-instruction-billing.html"
let internet_instr01 = cmake Path.root "internet-instruction-01.png"
let internet_instr02 = cmake Path.root "internet-instruction-02.png"
let internet_instr03 = cmake Path.root "internet-instruction-03.png"
let internet_instr04 = cmake Path.root "internet-instruction-04.png"
let internet_instr05 = cmake Path.root "internet-instruction-05.png"

