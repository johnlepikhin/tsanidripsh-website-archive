
module Html5 = Html5.M

let tbl_row = List.map (fun p -> << <td>$str:Tpl_prices.to_string p$</td> >> )

let tbl_price = Tbl.simple ~className:"prices"

let tbl_living =
	let make_class_table (name, sizes, prices) =
		let open Prices_make in
		let make_month p =
			if p.month_start = p.month_end then
				Month.to_string p.month_start
			else
				Printf.sprintf "%s-%s" (Month.to_string p.month_start) (Month.to_string p.month_end)
		in
		let months = List.map make_month prices in
		let rec make_sizes = function
			| [] -> ""
			| last :: [] -> Printf.sprintf "или %i" last
			| hd :: tl -> Printf.sprintf "%i %s" hd (make_sizes tl)
		in
		let sizes = make_sizes sizes in
		let tbl = tbl_price ~head:(name :: months) [ << <th> Мест в номере: $str:sizes$ </th> >> :: (List.map (fun p -> p.price) prices |> tbl_row) ] in
		<< <div> <h3>Номера "$str:name$"</h3>$tbl$ * Цены указаны за человека в сутки.</div> >>
	in
	let classes = List.map make_class_table Prices_make.agregated_live in
	<< <div> $list:classes$ </div> >>


let tbl_transfer = tbl_price [
	<< <th>Из аэропорта Адлера, за машину</th> >> :: tbl_row [Prices.transfer_aeroport];
	<< <th>От ж/д вокзала Адлера, за машину</th> >> :: tbl_row [Prices.transfer_railroad];
	<< <th>От границы (встреча), за машину</th> >> :: tbl_row [Prices.transfer_from_border];
	<< <th>От ж/д вокзала Цандрипша, за машину</th> >> :: tbl_row [Prices.transfer_from_border];
	<< <th>До границы (проводы), за машину</th> >> :: tbl_row [Prices.transfer_to_border];
	<< <th>До аэропорта/вокзала Адлера, за машину<br/>помощь с багажом на границе</th> >> :: tbl_row [Prices.transfer_to_aeroport];
]

let tbl_tours = tbl_price [
	<< <th>Озеро рица <br/> (без учета стоимости входного билета)</th> >> :: tbl_row [Prices.tour_riza];
	<< <th>Новоафонская пещера <br/> (без учета стоимости входного билета)</th> >> :: tbl_row [Prices.tour_cave];
	<< <th>Сухумский ботанический сад + обезьяний питомник <br/> (без учета стоимости входного билета)</th> >> :: tbl_row [Prices.tour_sukhum];
	<< <th>Цандрипшский каньон</th> >> :: tbl_row [Prices.tour_canyon];
	<< <th>Оба Цандрипшских каньона, с рыбалкой</th> >> :: tbl_row [Prices.tour_canyon2];
	<< <th>Конные прогулки, 3 часа с инструктором</th> >> :: tbl_row [Prices.tour_horses];
	<< <th>Альпийские луга Кавказа</th> >> :: tbl_row [Prices.tour_alps];
	<< <th>Альпийские луга Кавказа с пикником</th> >> :: tbl_row [Prices.tour_alps_bbq];
]

let tbl_food = tbl_price [
	<< <th>Вино, за полтора литра</th> >> :: tbl_row [200];
	<< <th>Чача, за поллитра</th> >> :: tbl_row [150];
	<< <th>Мандариновый сок, за три литра</th> >> :: tbl_row [200];
	<< <th>Сок фейхоа, за три литра</th> >> :: tbl_row [200];
	<< <th>Мандарины, кг</th> >> :: tbl_row [15];
	<< <th>Хурма, кг</th> >> :: tbl_row [25];
	<< <th>Фейхоа, кг</th> >> :: tbl_row [25];
]

let tbl_other = tbl_price [
	<< <th>Wi-Fi, в сутки с комнаты<br/>(просим не качать торенты и фильмы)</th> >> :: tbl_row [Prices.wifi_per_room];
	<< <th>Место для вашей машины</th> >> :: tbl_row [0];
	<< <th>Большой мангал</th> >> :: tbl_row [0];
	<< <th>Пользование оборудованной кухней</th> >> :: tbl_row [0];
	<< <th>Стиральная машинка, раз в неделю</th> >> :: tbl_row [0];
]

let lst = [
	"Проживание",
	<<
		<div class="prices_main">
			$Tpl_img.text_img ~right:true ~text:"Вид на море из нашего дома. 550 метров напрямую, 750 метров по дорожкам, 7 минут пешком." (Gallery_static.Tag (Gallery.condition06, Gallery.Condition))$
			<p>
				Наш гостевой дом расположен в прибрежной части курортного поселка Цандрипш Гагринского района Абхазии. Дом находится
				в достаточной удаленности от магистралей и шумных кафе, но при этом близко к морю — это идеальное место для отдыха в дали от городской суеты.
				В доме номера <b>эконом</b> и <b>стандарт</b> класса.  В номерах 1,5 спальные кровати по количеству проживающих, тумбочки, платяные шкафы,
				вентиляторы. Номера с ремонтом. <b>На этаже</b> есть душевые, туалеты, умывальники.
			</p>

			<p>
				К услугам отдыхающих:
			</p>
			<ul>
				<li><b>Wi-Fi</b> на скорости до 7 мегабит (просим не качать торренты и фильмы, чтобы канала хватило всем гостям);</li>
				<li>кухня со всем необходимым;</li>
				<li>горячая и холодная вода круглосуточно;</li>
				<li>стиральная машина (полная загрузка, раз в 3-4 дня);</li>
				<li>спутниковое телевидение;</li>
				<li>парковка во дворе;</li>
				<li>мангал.</li>
			</ul>
			<p>
				Есть общие площадки с видом на море, где приятно провести обеденное время. В шаговой доступности от дома – несколько столовых и кафе с домашней кухней. Чистый
				широкий пляж, потрясающие виды на горы. До моря 750 метров, это 6-7 минут пешком.
			</p>

			$tbl_living$

			<p>
				Класс <b>Стандарт</b> отличается от <b>Эконом</b> качеством ремонта. Номера Стандарт имеют традиционный гостиничный ремонт (ламинат, стены обшиты натуральным
				деревом). Номера Эконом сделаны на базе деревенского дома: на стенах обои, на полу вместо современного ламината ковры. Подробно ознакомиться с номерами можно
				на <a href=$Page_common.url Page.p_rooms$>специальной странице</a>.
			</p>
			<p>
				Возможны индивидуальные скидки. Предоставляем возможность <a href=$Page_common.url Page.p_billing$>забронировать номер</a> с предварительной оплатой на наш счет в Сбербанке.
				<a href=$Page_common.url Page.p_contacts$>Позвоните</a>, чтобы узнать подробности.
			</p>
		</div>
	>>;

	"Трансфер",
	<<
		<div class="prices_main">
			<p>
				Для вашего комфорта, мы предоставляем услугу трансфера как по территории России, так и в Абхазии. Своих гостей мы возим на комфортном современном
				транспорте со всеми удобствами.
			</p>
			$tbl_transfer$
		</div>
	>>;

	"Туры",
	<<
		<div class="prices_main">
			$Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.afon04, Gallery.Tours))$
			<p>
				Абхазия — древняя и удивительная страна. В ней можно увидеть крепости раннего средневековья, побывать в гигантских пещерах или увидеть мир с высоты птичьего полета.
				Мы предлагаем вам <a href=$Page.url Page.p_tours$>взглянуть на эти красоты</a>.
			</p>
			$tbl_tours$
			<p>
				Есть возможность получить скидку — 100 рублей с каждого человека — при <a href=$Page_common.url Page.p_billing$>бронировании заранее</a>.
			</p>
		</div>
	>>;

	"Напитки и еда",
	<<
		<div class="prices_main">
			<p>
				Ежегодно мы создаем вкуснейшие напитки для своих гостей. Вино, чача (виноградная водка), мандариновый сок. Всё это делаем из урожая собственного фруктового сада.
			</p>
			$tbl_food$
		</div>
	>>;

	"Прочие услуги",
	tbl_other;
]

let lst =
	let id = ref 0 in
	List.map (fun (a, b) -> incr id; a, b, !id) lst

let left =
	let els = List.map (fun (title, _, id) -> << <p><a href=$str:"#info"^(string_of_int id)$>$str:title$</a></p> >>) lst in
	<<
		<aside class="main">
			<h1>Оглавление</h1>
			$list:els$
		</aside>
	>>

let center =
	let els = List.map (fun (title, answer, id) -> << <div><h2 id=$str:"info"^(string_of_int id)$>$str:title$</h2>$answer$<br/></div> >>) lst in
	<<
		<div class="tpl_main_center">
			<h1>Цены на сезон $str:Config.year$</h1>
			$list:els$
		</div>
	>>

include Page.Make (struct
	let title = "Цены и услуги"

	let contents_name = Some (Config.season ^ ". Полный прайслист.")

	let path = Page.p_prices

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title ~left center
end)
