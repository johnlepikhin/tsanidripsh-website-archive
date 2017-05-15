module Html = Tyxml.Html

let center =
	let open Gallery in
	<<
		<div class="tpl_main_center">
			<h2>Номера "Стандарт"</h2>
			Номера класса "Стандарт" имеют количество полутораместных кроватей по числу проживающих, шкаф, тумбочку, холодильник, телевизор.
			В каждом номере современные пластиковые окна и кондиционер (функции охлаждения и обогрева).
			<h3>Двухместный номер класса "Стандарт"</h3>
			$Tpl_pano360.pano360 Static.pano_room_standard_2beds$
			$Tpl_pano360.hint$
			<h3>Трехместный номер класса "Стандарт"</h3>
			$Tpl_pano360.pano360 Static.pano_room_standard_3beds$
			$Tpl_pano360.hint$

			<h2>Номера "Эконом"</h2>
			Номера класса "Эконом" имеют количество полутораместных кроватей по числу проживающих, шкаф, тумбочку и телевизор.
			В каждом номере современные пластиковые окна и вентилятор.
			<h3>Трехместный номер класса "Эконом"</h3>
			$Tpl_pano360.pano360 Static.pano_room_economic_3beds$
			$Tpl_pano360.hint$
			<h3>Четырехместный номер класса "Эконом"</h3>
			$Tpl_pano360.pano360 Static.pano_room_economic_4beds$
			$Tpl_pano360.hint$
		</div>
	>>

include Page.Make (struct
	let title = "Экскурсия по номерам в 3D"

	let contents_name = Some "Экскурсия по номерам в 3D"

	let path = Page.p_rooms_tour

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title center
end)



