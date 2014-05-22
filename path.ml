
type t = string list

let paths : t list ref = ref []

let to_string t =
	let p = String.concat "/" t in
	Printf.sprintf "/%s" p

let make l =
	if List.mem l !paths then
		raise (failwith (Printf.sprintf "Path '%s' registered twice" (to_string l)))
	else
	begin
		paths := l :: !paths;
		l
	end

let root = make []

let tours = make ["tours"]

let gallery = make ["gallery"]

let articles = make ["articles"]
