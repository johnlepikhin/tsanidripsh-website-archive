
module M
	: sig
		type t

		val all: ?limit:int -> unit -> t list

		val make:
			?contents_name:string ->
			urls:PageURLs.t ->
			title:string ->
			?left:Html_types.div_content Tpl.Html.elt ->
			Tpl.center ->
			t

		val page: t -> Page.t
	end
	= struct
		type t = {
			page : Page.t;
		}

		let list = ref []

		let all ?limit () =
			match limit with
				| None ->
					!list
				| Some limit ->
					let rec loop n = function
						| hd :: tl when n<=limit -> hd :: loop (n+1) tl
						| _ -> []

					in
					loop 1 !list

		let make ?contents_name ~urls ~title ?left center =
			let doc () = Tpl.tpl_base ~title ~position:Tpl.Position.Information ?left center in
			let page = Page.anonymous ?contents_name urls doc title in
			let article = { page } in
			list := article :: !list;
			article

		let page t = t.page
	end

include M


let articles_list limit =
	let module Html = Tyxml.Html in
	let f a =
		let page = page a in
		let url = Page.url page.Page.urls in
		[%html
			"<div>
				<a href="url">"[Html.pcdata page.Page.title]"</a>
			</div>"
		]
	in
	all ~limit () |> List.rev |> List.map f

let articles_list_titles limit =
	let module Html = Tyxml.Html in
	let f a =
		let page = page a in
		let url = Page.url page.Page.urls in
		[%html
			"<a href="url"><h2>"[Html.pcdata page.Page.title]"</h2></a>"
		]
	in
	all ~limit () |> List.rev |> List.map f
