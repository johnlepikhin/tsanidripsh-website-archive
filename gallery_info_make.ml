
type t = {
	url : string;
	width : int;
	height : int;
	ratio : float;
}

let info = Hashtbl.create 101

let add url width height =
	let ratio = (float_of_int width) /. (float_of_int height) in
	let t = { url; width; height; ratio } in
	Hashtbl.add info url t

let get url =
	try
		let v = Hashtbl.find info url in
		Some v
	with
		| _ ->
			None
