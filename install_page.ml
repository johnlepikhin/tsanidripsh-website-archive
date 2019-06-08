
include Page

let create_single_html_file file doc =
  let s = Html_print.to_string doc in
  let main_path = Printf.sprintf "%s/%s" !Config.install_path file in
  let ch = open_out main_path in
  output_string ch s;
  close_out ch
      
let create_page page =
  (* создать основную страницу *)
  page.doc () |> create_single_html_file (Page.url page.urls);
  (* создать редиректы *)
  let redirect_doc = Tpl.tpl_redirect page.urls in
  List.iter (fun url -> create_single_html_file url redirect_doc) (Page.historic_urls page.urls)

let create_all () =
  List.iter create_page !pages
