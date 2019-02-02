
let init () =
  Js_util.init_body ();
  let open Js_page in
  Js_anypage.init ();
  let%lwt () = Js_gallery.check_url () in
  Js_gallery.GRows.init ()

let _ =
  ignore (init ())
