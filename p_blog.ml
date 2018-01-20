module Html = Tyxml.Html

let center =
	let titles = Article.articles_list_titles 1000 in
	[%html "<div class='tpl_main_center'>"titles"</div>"]

include Page.Make (struct
	let title = "Интересное об Абхазии и Цандрипше"

	let contents_name = Some "Интересно об Абхазии и Цандрипше"

	let path = Page.p_blog

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Blog ~title center
end)

