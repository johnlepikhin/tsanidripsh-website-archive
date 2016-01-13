
module M
	: sig
		type t

		val all: ?limit:int -> unit -> t list

		val make:
			?contents_name:string ->
			path:Page.path ->
			title:string ->
			?left:Html5_types.div_content Tpl.Html5.elt ->
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

		let make ?contents_name ~path ~title ?left center =
			let doc () = Tpl.tpl_base ~title ~position:Tpl.Position.Information ?left center in
			let page = Page.anonymous ?contents_name path doc title in
			let article = { page } in
			list := article :: !list;
			article

		let page t = t.page
	end

include M


let articles_list limit =
	let module Html5 = Html5.M in
	let f a =
		let page = page a in
		<<
			<div>
				<a href=$str:Page.url page.Page.path$>$str:page.Page.title$</a>
			</div>
		>>
	in
	all ~limit () |> List.rev |> List.map f
