
let init () =
	Js_util.init_body ();
	let open Js_page in
	Js_anypage.init ();
	match page with
		| Gallery ->
			Js_gallery.GRows.init ()
		| Other ->
			Lwt.return ()

let _ = ignore (init ())
