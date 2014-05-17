
let init () =
	let open Js_page in
	match page with
		| Gallery ->
			Js_gallery.init ()
		| Other ->
			Lwt.return ()

let _ = ignore (init ())
