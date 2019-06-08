include Page_common

module Html = Tyxml.Html

type t = {
    urls : PageURLs.t;
    doc : unit -> Html.doc;
    title : string;
    contents_name : string option;
  }

let pages = ref []
let paths = ref []

module type PAGE =
  sig
    val title : string

    val contents_name : string option

    val urls : PageURLs.t

    val doc : unit -> Html.doc
  end

let register (p : t) =
  let new_paths = (url p.urls) :: historic_urls p.urls in
  List.iter (fun new_path ->
      if List.mem new_path !paths then
        Printf.sprintf "Page with path '%s' is already registered" new_path |> failwith;
      paths := new_path :: !paths
    ) new_paths;
  pages := p :: !pages

let anonymous ?contents_name urls doc title =
  let p = { urls; doc; title; contents_name } in
  register p;
  p

module Make (P : PAGE) =
  struct
    include P

    let page = { urls; doc; title = P.title; contents_name }

    let urls = Page_common.url urls

    let () =
      register page
  end

