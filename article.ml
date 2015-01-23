
module M
	: sig
		type t

		val all: ?limit:int -> unit -> t list

		val make:
			?contents_name:string ->
			path:Page.path ->
			title:string ->
			?left:Html5_types.div_content Tpl.Html5.elt ->
			Html5_types.div_content Tpl.Html5.elt ->
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

		let make ?contents_name ~path ~title ?left text =
			let doc () = Tpl.tpl_base ~title ~position:Tpl.Position.Information ?left text in
			let page = Page.anonymous ?contents_name path doc title in
			let article = { page } in
			list := article :: !list;
			article

		let page t = t.page
	end

include M

