
include Page.Make (struct
	let title = "Отзывы"

	let contents_name = None

	let urls = Page.p_old_testimonials

	let doc () = Tpl.tpl_redirect Page.p_feedbacks
end)

