include Page.Make (struct
	let title = "404"

	let contents_name = None

	let urls = Page.p_404

	let doc () = Tpl.tpl_redirect Page.p_main
end)

