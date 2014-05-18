
module Html5 = Html5.M

type t = {
	id : int;
	title : string;
	descr : string;
	preview : Html5_types.div_content Html5.elt;
	text : Html5_types.div_content Html5.elt;
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

let lst =
	let i = ref 0 in
	List.map (fun (title, descr, preview, text) ->
		incr i;
		let file = Printf.sprintf "tour_%i" !i in
		let doc = gen_tour_doc title descr preview text in
		let page = Page.anonymous (Path.tours, file) doc in
		{ id = !i; title; descr; preview; text; page }
	) Tours.lst

let left =
	let lst = List.map (fun t -> << <a href=$str:Printf.sprintf "#%i" t.id$>$str:t.title$<br/></a> >> ) lst in
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
					<h1 id=$str:Printf.sprintf "#tour%i" t.id$>$str:t.title$</h1>
					<b>$str:t.descr$</b>
					$t.preview$
					<p>
						<a href=$Page.url t.page.Page.path$>Читать далее &gt;&gt;&gt;</a>
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
	let path = Page.p_tours

	let doc = Tpl.tpl_base ~position:Tpl.Position.Tours ~title:"Экскурсии и туры" ~left center
end)
