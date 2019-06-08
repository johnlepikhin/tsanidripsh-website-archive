include Page.Make (struct
	let title = "Отзывы"

	let contents_name = None

	let urls = Page.p_old_rooms_tour

	let doc () = Tpl.tpl_redirect Page.p_rooms_tour
end)


