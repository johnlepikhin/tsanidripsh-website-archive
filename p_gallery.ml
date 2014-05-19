
module Html5 = Html5.M

let left = <<
	<aside class="main">
		<h1>Тематика фотографий:</h1>

			<h2>Условия проживания</h2>
			<h2>Пляж и море</h2>
			<h2>Наш поселок</h2>
			<h2>Экскурсии</h2>
			<h2>Все фотографии</h2>
	</aside>
>>

let center = <<
	<div class="tpl_main_center">
		<div id=$str:Common_config.div_center_gallery$ class="gallery_main">
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

	let doc () = Tpl.tpl_base ~page:"gallery" ~position:Tpl.Position.Gallery ~title center
end)
