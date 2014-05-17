
type t = {
	url : string;
	width : int;
	height : int;
}

let info = Hashtbl.create 101

let add url width height =
	let t = { url; width; height } in
	Hashtbl.add info url t
