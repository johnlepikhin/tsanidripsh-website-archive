open Static

let src_full_path p = Printf.sprintf "%s%s" Config.static_path (Purl.to_string p)

let dst_full_path p = Printf.sprintf "%s%s" !Config.install_path (Purl.to_string p)

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


