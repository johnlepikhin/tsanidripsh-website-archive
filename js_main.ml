
let init () =
	lwt () = Js_util.init_body () in
	let open Js_page in
	match page with
		| Gallery ->
			Js_gallery.GRows.init ()
		| Other ->
			Lwt.return ()

let _ = ignore (init ())
