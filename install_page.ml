
include Page

let create_all () =
	let f p =
		let s = Html_print.to_string p.doc in
		let path = Printf.sprintf "%s/%s" Config.save_path (Page.url p.path) in
		let ch = open_out path in
		output_string ch s;
		close_out ch
	in
	List.iter f !pages
