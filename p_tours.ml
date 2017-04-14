
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
	Tpl.tpl_base ~title ~position:Tpl.Position.Tours ~description:descr <<
		<div class="tpl_main_center">
			<h1>$str:title$</h1>
			<b>$str:descr$</b>
			$preview$
			$text$
		</div>
	>>

let lst = List.map (fun (url, str_id, title, descr, preview, text) ->
	let doc () = gen_tour_doc title descr preview text in
	let page = Page.anonymous ~contents_name:(Printf.sprintf "Экскурсия: %s" descr) url doc title in
	{ str_id; title; descr; preview; text; page }
) Tours.lst

let left =
	let lst = List.map (fun t -> << <p><a href=$str:Printf.sprintf "#tour_%s" t.str_id$>$str:t.title$<br/></a></p> >> ) lst in
	<<
		<aside class="main">
			<h1>Оглавление</h1>
			$list:lst$
		</aside>
	>>

let center =
	let lst = List.map (fun t ->
			<<
				<div>
					<h2 id=$str:Printf.sprintf "tour_%s" t.str_id$>$str:t.title$</h2>
					<b>$str:t.descr$</b>
					$t.preview$
					<p>
						<a href=$Page.url t.page.Page.path$>Читать дальше &gt;&gt;&gt;</a>
					</p>
					<div class="float_clean"/>
				</div>
			>>
		) lst
	in
	<<
		<div class="tpl_main_center">
			$list:lst$
		</div>
	>>

include Page.Make (struct
	let title = "Туры"

	let contents_name = Some "Экскурсии по Абхазии и горам"

	let path = Page.p_tours

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Tours ~title ~left center
end)
