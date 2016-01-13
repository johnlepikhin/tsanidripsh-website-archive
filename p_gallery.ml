
module Html5 = Html5.M

let center = <<
	<div class="tpl_main_center">
		<p>
			Кликните на интересующую фотографию, чтобы рассмотреть в подробностях. Фотографии в просмотре можно листать стрелочками на клавиатуре ← →
		</p>
		<div id=$str:Id.to_string Id.div_center_gallery$ class="gallery_main">
		</div>
		<small>
			<a href=$Page_common.url Page_common.p_gallery_all$>Для старых браузеров: все фотографии одним списком</a>
		</small>
	</div>
>>

include Page.Make (struct
	let title = "Фотографии"

	let contents_name = Some "Все фотографии сайта"

	let path = Page.p_gallery

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Gallery ~title center
end)
