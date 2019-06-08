
include Page.Make (struct
	let title = "Новый Афон"

	let contents_name = None

	let urls = Page.p_old_tours_afon

	let doc () = Tpl.tpl_redirect Page.p_tours_afon
end)

