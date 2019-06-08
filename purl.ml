
type t = {
    path : Path.t;
    file : string;
  }

let to_string t =
  if t.path = [] then
    Printf.sprintf "/%s" t.file
  else
    let p = Path.to_string t.path in
    Printf.sprintf "%s/%s" p t.file

let make path file = { path; file; }
