
module Html = Tyxml.Html

type t = {
  str_id : string;
  title : string;
  descr : string;
  preview : Html_types.div_content Html.elt;
  text : Html_types.div_content Html.elt;
  page : Page.t;
}

let gen_tour_doc title descr preview text =
  Tpl.tpl_base ~title ~position:Tpl.Position.Main ~description:descr [%html
    "<div class='tpl_main_center'>
            <h1>"[Html.pcdata title]"</h1>
            <b>"[Html.pcdata descr]"</b>"
      [preview;
       text]
      "</div>"
  ]

let lst = List.map (fun (url, str_id, title, descr, preview, text) ->
    let doc () = gen_tour_doc title descr preview text in
    let page = Page.anonymous ~contents_name:(Printf.sprintf "Экскурсия: %s" descr) url doc title in
    { str_id; title; descr; preview; text; page }
  ) Tours.lst

let left =
  let lst = List.map (fun t ->
      let href = Printf.sprintf "#tour_%s" t.str_id in
      let title = t.title in
      [%html "<p><a href="href">"[Html.pcdata title]"<br></a></p>" ] ) lst
  in
  [%html "<aside class='main'><h1>Оглавление</h1>"lst"</aside>" ]

let center =
  let lst = List.map (fun t ->
      let tour_href = Printf.sprintf "tour_%s" t.str_id in
      let title = t.title in
      let descr = t.descr in
      let preview = t.preview in
      let read_href = Page.url t.page.Page.urls in
      [%html
        "<div>
                    <h2 id="tour_href">"[Html.pcdata title]"</h2>
                    <b>"[Html.pcdata descr]"</b>"
          [preview]
          "<p>
                        <a href="read_href">Читать дальше &gt;&gt;&gt;</a>
                    </p>
                    <div class='float_clean'></div>
                </div>"
      ]
    ) lst
  in
  [%html "<div class='tpl_main_center'>"lst"</div>" ]

include Page.Make (struct
    let title = "Туры"

    let contents_name = Some "Экскурсии по Абхазии и горам"

    let urls = Page.p_tours

    let doc () = Tpl.tpl_base ~position:Tpl.Position.Main ~title ~left center
  end)
