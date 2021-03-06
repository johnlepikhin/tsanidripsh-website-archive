
type t = {
	src : Purl.t;
	dst : Purl.t;
}

let files = ref []

let url t =
	Purl.to_string t.dst

let url_full t =
	"http://" ^ Config.site_domain ^ (url t)

let make psrc fsrc pdst fdst =
	let src = Purl.make psrc fsrc in
	let dst = Purl.make pdst fdst in
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

let umake purl = Purl.(cmake purl.path purl.file)

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

let htaccess = cmake Path.root ".htaccess"

let vrview = cmake Path.root ""

let christmas_tree = cmake Path.root "christmas_tree.svg"
let yacht = cmake Path.root "yacht.svg"
let sea = cmake Path.root "sea.svg"
let orange = cmake Path.root "orange.svg"

let pano_room_standard_2beds = cmake Path.pano360 "room-standard-2beds.jpg"
let pano_room_standard_3beds = cmake Path.pano360 "room-standard-3beds.jpg"
let pano_room_economic_3beds = cmake Path.pano360 "room-economic-3beds.jpg"
let pano_room_economic_4beds = cmake Path.pano360 "room-economic-4beds.jpg"

let pano_tsandripsh_temple1 = cmake Path.pano360 "tsandripsh-temple1.jpg"
let pano_tsandripsh_temple2 = cmake Path.pano360 "tsandripsh-temple2.jpg"
let pano_tsandripsh_temple3 = cmake Path.pano360 "tsandripsh-temple3.jpg"

let pano_tsandripsh_beach1 = cmake Path.pano360 "tsandripsh-beach1.jpg"
let pano_tsandripsh_beach2 = cmake Path.pano360 "tsandripsh-beach2.jpg"
let pano_tsandripsh_beach3 = cmake Path.pano360 "tsandripsh-beach3.jpg"
