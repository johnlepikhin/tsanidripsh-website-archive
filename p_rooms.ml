
module Html = Tyxml.Html

let center =
	let open Gallery in
	let img i = Tpl_img.textbig_img (Gallery_static.Tag (i, Gallery.Condition)) in
	<<
		<div class="tpl_main_center">
			<h2>Первый дом</h2>
			Этот гостевой дом построен в 2015 году. Номера класса "Стандарт" имеют количество полутораместных кроватей по числу проживающих, шкаф, тумбочку, холодильник:
			$img condition41$
			В каждом номере современные пластиковые окна, вентилятор (с 2016 года и кондиционер!):
			$img condition41$
			Трехместный номер:
			$img condition40$
			$img condition39$
			<h2>Второй дом</h2>
			Дом построен в 2010 году. Все номера класса "Стандарт" имеют единое оформление.
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
			$img condition31$
			Несколько 4-местных номеров имеют отдельный уютный балкон:
			$img condition29$
			Окна номеров выходят либо в сад, либо имеют вид на море:
			$img condition01$
			<h2>Территория</h2>
			Современный санузел:
			$img condition02$
			$img condition03$
			Душевая:
			$img condition18$
			Предоставляем оборудованную кухню (две газовых плиты, два чайника, две микроволновки, вся необходимая посуда):
			$img condition20$
		</div>
	>>

include Page.Make (struct
	let title = "Экскурсия по номерам"

	let contents_name = Some "Экскурсия по номерам"

	let path = Page.p_rooms

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title center
end)


