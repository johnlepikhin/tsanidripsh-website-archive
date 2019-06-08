
module Html = Tyxml.Html

let center =
	let id = Id.to_string Id.div_center_gallery in
	let href = Page_common.url Page_common.p_gallery_all in
	[%html
	"<div class='tpl_main_center'>
		<p>
			Кликните на интересующую фотографию, чтобы рассмотреть в подробностях. Фотографии в просмотре можно листать стрелочками на клавиатуре ← →
		</p>
		<div id="id" class='gallery_main'>
		</div>
		<small>
			<a href="href">Для старых браузеров: все фотографии одним списком</a>
		</small>
	</div>"
]

include Page.Make (struct
	let title = "Фотографии"

	let contents_name = Some "Все фотографии сайта"

	let urls = Page.p_gallery

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Gallery ~title center
end)
