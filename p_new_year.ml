
module Html5 = Html5.M

let img p =
	let t = Html5.img ~src:(Static.url p) ~alt:"" () in
	<<
		<div class="textnb_img">
			$t$
		</div>
	>>

let imgr p =
	let t = Html5.img ~src:(Static.url p) ~alt:"" () in
	<<
		<div class="textnb_img textnb_img_right swing">
			$t$
		</div>
	>>

let bottomimg =
	let t = Html5.img ~src:(Static.url Static.sea) ~alt:"" () in
	<<
		<div class="sea_img">
			$t$
		</div>
	>>

let center = <<
	<div class="tpl_main_center">
		$img Static.christmas_tree$
		<h2>
			Новогодняя ночь. Снег. Мороз. Люди в тяжелых шубах. Где-то опять потерялся Дед Мороз… Надоело!
		</h2>
		<p class="attention">
			<b>Вот как надо:
			<br/>
			Море! Солнце! Пляж! Мандарины на ветках! Живые бабочки летают вокруг ёлки!
			</b>
		</p>
		<h1>Новый Год на море!</h1>
		<p>
			Уникальное предложение! Приглашаем Вас отпраздновать наступающий $str:Config.year$-й Новый Год на берегу Черного моря, в Абхазии! Гарантируем полное отсутствие снега, отличный пляж,
			мандарины прямо с ветки, новогодний банкет из кавказкой национальной и русской кухни и многое другое.
		</p>
		$imgr Static.yacht$
		<h2>
			Мы предлагаем:
		</h2>
		<ul>
			<li>Комфортное проживание в номерах <a href=$Page_common.url Page.p_rooms$>класса "Стандарт"</a>;</li>
			<li>Бесплатная <a href=$Page_common.url Page.p_tours$>экскурсия на выбор</a>, если наберется более четырех желающих;</li>
			<li>Новогодний банкет: кавказская национальная кухня, русская кухня;</li>
			<li>Большая ёлка во дворе;</li>
			<li>Теплая оборудованная кухня для желающих готовить самостоятельно;</li>
			<li>В подарок мандарины из нашего сада.</li>
		</ul>
		<div>
			Посмотрите всё сами в <a href=$Page_common.url Page.p_gallery$>нашей фотогалерее</a>.
		</div>
		<h2>
			Цены на новогодние праздники:
		</h2>
		<ul>
			<li>Сутки проживания с трехразовым питанием: <b>1300 руб</b>;</li>
			<li>Сутки проживания без питания (предоставляется оборудованная кухня): <b>500 руб</b>;</li>
			<li>Новогодний стол (банкет): <b>2000 руб</b></li>
		</ul>
		<div>
			Спешите <a href=$Page_common.url Page.p_billing$>забронировать места</a>, предложение ограничено!
		</div>
		<br/>
		<div>
			Все подробности можете узнать по телефонам, указанным на <a href=$Page_common.url Page.p_contacts$>странице контактов</a>.
		</div>
		$bottomimg$
	</div>
>>

include Page.Make (struct
	let title = "В Абхазию на Новый Год"

	let contents_name = if Config.is_new_year then Some "Встреча Нового Года" else None

	let path = Page.p_new_year

	let doc () = Tpl.tpl_base_newyear ~position:Tpl.Position.Main ~title center
end)


