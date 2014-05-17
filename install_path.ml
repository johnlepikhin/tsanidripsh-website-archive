open Path

let create_all () =
	let f t =
		let s = to_string t in
		let s = Printf.sprintf "%s/%s" Config.save_path s in
		let _ = Sys.command (Printf.sprintf "mkdir -p '%s'" s) in
		()
	in
	List.iter f !paths


