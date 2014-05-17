
type t =
	| Gallery
	| Other

let of_string = function
	| "gallery" -> Gallery
	| _ -> Other

let page =
	let p = Js.Unsafe.variable Common_config.page_var in
	let ptype = Js.typeof p in
	let ptype = Js.to_string ptype in
	if ptype = "undefined" then
		Other
	else
		let p = Js.to_string p in
		of_string p
