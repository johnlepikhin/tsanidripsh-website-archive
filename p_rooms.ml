
module Html5 = Html5.M

let center =
	let open Gallery in
	let img = Tpl_img.textbig_img Condition in
	<<
		<div class="tpl_main_center">
			Все наши номера класса "Стандарт" имеют единое оформление:
			$img condition08$
			На полу ламинат, стены обшиты натуральным деревом. Пластиковые окна:
			$img condition09$
			$img condition12$
			В номерах на 2 и 3 человека одна двухместная кровать и одна полутораместная:
			$img condition24$
			В каждом номере есть вентилятор.
			В номерах на 4 человека одна двухместная кровать и одна двухэтажная. Такие номера прекрасно подходят семьям с двумя детьми: детям очень нравятся такие кровати:
			$img condition25$
			$img condition26$
			$img condition27$
			$img condition30$
			$img condition31$
			Несколько 4-местных номеров имеют отдельный уютный балкон:
			$img condition29$
			Окна номеров выходят либо в сад, либо имеют вид на море:
			$img condition01$
			Современный санузел:
			$img condition02$
			$img condition03$
			Душевая:
			$img condition18$
			Предоставляем оборудованную кухню (две газовых плиты, два чайника, две микроволновки, вся необходимая посуда):
			$img condition04$
			$img condition05$
			$img condition20$
			$img condition22$
		</div>
	>>

include Page.Make (struct
	let title = "Экскурсия по номерам"

	let contents_name = Some "Экскурсия по номерам"

	let path = Page.p_rooms

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title center
end)

