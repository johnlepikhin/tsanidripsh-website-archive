
type t = Path.t * string

let to_string (path, file) =
	if path = [] then
		Printf.sprintf "/%s" file
	else
		let p = Path.to_string path in
		Printf.sprintf "%s/%s" p file

let make path file = path, file
