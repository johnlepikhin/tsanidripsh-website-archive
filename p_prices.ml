
module Html5 = Html5.M

let tbl_row = List.map (fun p -> << <td>$str:Tpl_prices.to_string p$</td> >> )

let tbl_price = Tbl.simple ~className:"prices"

let tbl_living = tbl_price ~head:["номера"; "январь-май"; "июнь"; "июль"; "август"; "сентябрь"; "октябрь-декабрь"] [
	<< <th>Эконом (мест в номере: 2, 3 или 4)</th> >> :: tbl_row [150; 200; 250; 300; 250; 200];
	<< <th>Стандарт (мест в номере: 2, 3 или 4)</th> >> :: tbl_row [200; 250; 300; 350; 250; 250];
]

let tbl_transfer = tbl_price [
	<< <th>Из аэропорта Адлера или обратно, за машину</th> >> :: tbl_row [Prices.transfer_aeroport];
	<< <th>От ж/д вокзала Адлера или обратно, за машину</th> >> :: tbl_row [Prices.transfer_railroad];
	<< <th>От границы или обратно</th> >> :: tbl_row [Prices.transfer_inside];
	<< <th>От ж/д вокзала Цандрипша или обратно</th> >> :: tbl_row [Prices.transfer_inside];
]

let tbl_tours = tbl_price [
	<< <th>Озеро рица <br/> (без учета стоимости входного билета)</th> >> :: tbl_row [Prices.tour_riza];
	<< <th>Новоафонская пещера <br/> (без учета стоимости входного билета)</th> >> :: tbl_row [Prices.tour_cave];
	<< <th>Сухумский ботанический сад + обезьяний питомник <br/> (без учета стоимости входного билета)</th> >> :: tbl_row [Prices.tour_sukhum];
	<< <th>Цандрипшский каньон</th> >> :: tbl_row [Prices.tour_canyon];
	<< <th>Альпийские луга Кавказа</th> >> :: tbl_row [Prices.tour_alps];
	<< <th>Альпийские луга Кавказа с пикником</th> >> :: tbl_row [Prices.tour_alps_bbq];
]

let tbl_food = tbl_price [
	<< <th>Вино, за литр</th> >> :: tbl_row [150];
	<< <th>Чача, за поллитра</th> >> :: tbl_row [150];
	<< <th>Мандариновый сок, за три литра</th> >> :: tbl_row [150];
	<< <th>Мандарины, кг</th> >> :: tbl_row [15];
	<< <th>Хурма, кг</th> >> :: tbl_row [25];
	<< <th>Фейхоа, кг</th> >> :: tbl_row [25];
]

let tbl_other = tbl_price [
	<< <th>Охраняемое место для вашей машины</th> >> :: tbl_row [0];
	<< <th>Большой мангал</th> >> :: tbl_row [0];
	<< <th>Пользование оборудованной кухней</th> >> :: tbl_row [0];
	<< <th>Стиральная машинка, раз в неделю</th> >> :: tbl_row [0];
]

let lst = [
	"Проживание",
	<<
		<div class="prices_main">
			$Tpl_img.text_img ~right:true Gallery.Condition Gallery.condition06$
			<p>
				Наш гостевой дом расположен в прибрежной части курортного поселка Цандрипш Гагринского района Абхазии. Дом находится
				в достаточной удаленности от магистралей и шумных кафе, но при этом близко к морю — это идеальное место для отдыха в дали от городской суеты.
				В доме 12 номеров <b>эконом</b> и <b>стандарт</b> класса.  В номерах 1,5 спальные кровати по количеству проживающих, тумбочки, платяные шкафы,
				вентиляторы. Номера с ремонтом. Есть летний душ. 
			</p>

			<p>
				К услугам отдыхающих: парковка во дворе, кухня со всем необходимым, горячая и холодная вода круглосуточно, стиральная машина, мангал, спутниковое телевидение,
				есть общие площадки с видом на море, где приятно провести обеденное время. В шаговой доступности от дома – несколько столовых и кафе с домашней кухней. Чистый
				широкий пляж, потрясающие виды на горы. До моря 700 метров или 6 минут пешком. Есть возможность заказать экскурсии по Абхазии.
			</p>

			<p>
				Стоимость проживания <b>от 200 до 350 руб.</b> с человека в сутки в летний период и <b>от 150 до 250 руб</b> в межсезонье.
			</p>
			$tbl_living$
			<p>Возможны индивидуальные скидки. Предоставляем возможность забронировать номер с предварительной оплатой на наш счет в Сбербанке.
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
			$Tpl_img.text_img ~right:true Gallery.Tours Gallery.afon04$
			<p>
				Абхазия — древняя и удивительная страна. В ней можно увидеть крепости раннего средневековья, побывать в гигантских пещерах или увидеть мир с высоты птичьего полета.
				Мы предлагаем вам <a href=$Page.url Page.p_tours$>взглянуть на эти красоты</a>.
			</p>
			$tbl_tours$
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
			<h1>$str:Config.year$: цены</h1>
			$list:els$
		</div>
	>>

include Page.Make (struct
	let title = "Цены и услуги"

	let contents_name = Some (Config.year ^ ". Полный прайслист.")

	let path = Page.p_prices

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title ~left center
end)
