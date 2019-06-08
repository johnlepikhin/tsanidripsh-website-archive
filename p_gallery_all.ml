
module Html = Tyxml.Html

let lst =
	let open Gallery in
	let f p =
		let img = Html.img ~src:(Purl.to_string p.dest_512) ~alt:(Tpl_img.alt_of_tags p.tags) () in
		[%html "<div class='gallery_old_el'>"[img; p.description]"</div>"]
	in
	List.map f (List.rev !items)

let center =
	let href = Page.url Page.p_gallery in
	[%html
	"<div class='gallery_old_main'>
		<p>
			Если у вас Chrome, Firefox 10+, Internet Explorer 10+, то гораздо удобнее будет воспользоваться <a href="href">новой галереей</a>.
		</p>"
		lst
	"</div>"
]

include Page.Make (struct
	let title = "Все фотографии одним списком"

	let contents_name = None

	let urls = Page.p_gallery_all

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Gallery ~title center
end)
