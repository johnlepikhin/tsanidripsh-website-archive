
let init () =
	Js_util.init_body ();
	let open Js_page in
	Js_anypage.init ();
	lwt () = Js_gallery.check_url () in
	match page with
		| Gallery ->
			Js_gallery.GRows.init ()
		| Other ->
			Lwt.return ()

let _ = ignore (init ())
