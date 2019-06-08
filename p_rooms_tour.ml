module Html = Tyxml.Html

let center =
	let open Gallery in
	let pano_standard2 = Tpl_pano360.pano360 Static.pano_room_standard_2beds in
	let pano_standard3 = Tpl_pano360.pano360 Static.pano_room_standard_3beds in
	let pano_econom3 = Tpl_pano360.pano360 Static.pano_room_economic_3beds in
	let pano_econom4 = Tpl_pano360.pano360 Static.pano_room_economic_4beds in
	let pano_hint = Tpl_pano360.hint in
	[%html
		"<div class='tpl_main_center'>
			<h2>Номера «Стандарт»</h2>
			Номера класса «Стандарт» имеют количество полутораместных кроватей по числу проживающих, шкаф, тумбочку, холодильник, телевизор.
			В каждом номере современные пластиковые окна и кондиционер (функции охлаждения и обогрева).
			<h3>Двухместный номер класса «Стандарт»</h3>"
			[pano_standard2]
			[pano_hint]
			"<h3>Трехместный номер класса «Стандарт»</h3>"
			[pano_standard3]
			[pano_hint]
			"<h2>Номера «Эконом»</h2>
			Номера класса «Эконом» имеют количество полутораместных кроватей по числу проживающих, шкаф, тумбочку и телевизор.
			В каждом номере современные пластиковые окна и вентилятор.
			<h3>Трехместный номер класса «Эконом»</h3>"
			[pano_econom3]
			[pano_hint]
			"<h3>Четырехместный номер класса «Эконом»</h3>"
			[pano_econom4]
			[pano_hint]
		"</div>"
	]

include Page.Make (struct
	let title = "Экскурсия по номерам в 3D"

	let contents_name = Some "Экскурсия по номерам в 3D"

	let urls = Page.p_rooms_tour

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title center
end)



