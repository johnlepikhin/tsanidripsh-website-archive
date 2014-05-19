
include Page.Make (struct
	let title = "Отзывы"

	let contents_name = None

	let path = Page.p_old_testimonials

	let doc () = Tpl.tpl_redirect Page.p_feedbacks
end)

