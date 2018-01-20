
module Html = Tyxml.Html

let center =
	let open Gallery in
	let img i = Tpl_img.textbig_img (Gallery_static.Tag (i, Gallery.Condition)) in
	let img_condition01 = img condition01 in
	let img_condition02 = img condition02 in
	let img_condition03 = img condition03 in
	let img_condition08 = img condition08 in
	let img_condition09 = img condition09 in
	let img_condition12 = img condition12 in
	let img_condition18 = img condition18 in
	let img_condition20 = img condition20 in
	let img_condition24 = img condition24 in
	let img_condition25 = img condition25 in
	let img_condition26 = img condition26 in
	let img_condition27 = img condition27 in
	let img_condition29 = img condition29 in
	let img_condition31 = img condition31 in
	let img_condition39 = img condition39 in
	let img_condition40 = img condition40 in
	let img_condition41 = img condition41 in
	[%html
		"<div class='tpl_main_center'>
			<h2>Первый дом</h2>
			Этот гостевой дом построен в 2015 году. Номера класса «Стандарт» имеют количество полутораместных кроватей по числу проживающих, шкаф, тумбочку, холодильник:"
			[img_condition41]
			"В каждом номере современные пластиковые окна, вентилятор (с 2016 года и кондиционер!):"
			[img_condition41]
			"Трехместный номер:"
			[img_condition40]
			[img_condition39]
			"<h2>Второй дом</h2>
			Дом построен в 2016 году. Все номера класса «Стандарт» имеют единое оформление."
			[img_condition08]
			"На полу ламинат, стены обшиты натуральным деревом. Пластиковые окна:"
			[img_condition09]
			[img_condition12]
			"В номерах на 2 и 3 человека одна двухместная кровать и одна полутораместная:"
			[img_condition24]
			"В каждом номере есть вентилятор.
			В номерах на 4 человека одна двухместная кровать и одна двухэтажная. Такие номера прекрасно подходят семьям с двумя детьми: детям очень нравятся такие кровати:"
			[img_condition25]
			[img_condition26]
			[img_condition27]
			[img_condition31]
			"Несколько 4-местных номеров имеют отдельный уютный балкон:"
			[img_condition29]
			"Окна номеров выходят либо в сад, либо имеют вид на море:"
			[img_condition01]
			"<h2>Территория</h2>
			Современный санузел:"
			[img_condition02]
			[img_condition03]
			"Душевая:"
			[img_condition18]
			"Предоставляем оборудованную кухню (две газовых плиты, два чайника, две микроволновки, вся необходимая посуда):"
			[img_condition20]
		"</div>"
	]

include Page.Make (struct
	let title = "Экскурсия по номерам"

	let contents_name = Some "Экскурсия по номерам"

	let path = Page.p_rooms

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title center
end)


