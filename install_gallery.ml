
let need_create src dest =
  let src_info = try Some (Unix.stat src) with _ -> None in
  let dst_info = try Some (Unix.stat dest) with _ -> None in
  match src_info, dst_info with
  | None, _ -> false
  | _, None -> true
  | Some src_info, Some dst_info ->
     src_info.Unix.st_mtime > dst_info.Unix.st_mtime
     || dst_info.Unix.st_size = 0

let create_one file ext size dest =
  let source_path = Printf.sprintf "%s/%s.%s" Config.gallery_src_path file ext in
  let dest_path = Printf.sprintf "%s/%s" Config.static_path (Purl.to_string dest) in
  if need_create source_path dest_path then
    begin
      let cmd = Printf.sprintf "convert -scale x%i '%s' '%s'" size source_path dest_path in
      ignore (Sys.command cmd);
      ignore (Static.umake dest)
    end

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
