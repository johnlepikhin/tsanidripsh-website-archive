
module Html5 = Html5.M

let lst =
	let open Gallery in
	let f p =
		let img = Html5.img ~src:(Purl.to_string p.dest_512) ~alt:(Tpl_img.alt_of_tags p.tags) () in
		<<
			<div class="gallery_old_el">
				$img$
				$p.description$
			</div>
		>>
	in
	List.map f (List.rev !items)

let center = <<
	<div class="gallery_old_main">
		<h1>Галерея наших фотографий для пользователей устаревших браузеров</h1>
		<p>
			Если у вас Chrome, Firefox 10+, Internet Explorer 10+, то гораздо удобнее будет воспользоваться <a href=$Page.url Page.p_gallery$>новой галереей</a>.
		</p>
		$list:lst$
	</div>
>>

include Page.Make (struct
	let title = "Все фотографии одним списком"

	let contents_name = None

	let path = Page.p_gallery_all

	let doc () = Tpl.tpl_base ~page:"gallery_all" ~position:Tpl.Position.Gallery ~title center
end)
