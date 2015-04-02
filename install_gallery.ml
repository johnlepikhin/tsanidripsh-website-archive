
let create_one file ext size dest =
	let cmd = Printf.sprintf "convert -scale x%i '%s/%s.%s' '%s/%s'" size Config.gallery_src_path file ext Config.static_path (Purl.to_string dest) in
	ignore (Sys.command cmd);
	ignore (Static.umake dest)

let create_all () =
	let module C = Gallery in
	let f cg =
		create_one cg.C.file cg.C.ext 64 cg.C.dest_64;
		create_one cg.C.file cg.C.ext 256 cg.C.dest_256;
		create_one cg.C.file cg.C.ext 512 cg.C.dest_512;
		create_one cg.C.file cg.C.ext 1024 cg.C.dest_1024;
		create_one cg.C.file cg.C.ext 2048 cg.C.dest_2048;
	in
	List.iter f !Gallery.for_install
