
module Html5 = Html5.M

(*
let left = <<
	<aside class="main">
		<h1>Коротко об услугах</h1>

		<div class="main_service_title">
			Номера
		</div>
		<details class="main_service_details">
			Классы эконом и стандарт
		</details>

		<div class="main_service_title">
			Трансфер
		</div>
		<details class="main_service_details">
			Поможем добраться до нас от аэропорта Сочи, от ж/д вокзала или от границы.
		</details>

		<div class="main_service_title">
			Место для машины
		</div>
		<details class="main_service_details">
			За закрывающимися воротами двора всегда найдется место для вашей машины
		</details>

		<div class="main_service_title">
			Экскурсии
		</div>
		<details class="main_service_details">
			Хотите посетить известные места Абхазии, а также недоступные для туристов по путевке уголки страны?
			Цандрипшский каньон, озеро Рица (дача Сталина), Новоафонский монастырь, Новоафонская пещера, альпийские
			луга южного Кавказа.
		</details>


		<div class="main_service_title">
			Домашнее вино и чача
		</div>
		<details class="main_service_details">
			Из своего винограда для своих гостей мы ежегодно делаем вино и чачу (виноградную водку).
		</details>

		<div class="main_service_title">
			Фрукты из сада
		</div>
		<details class="main_service_details">
				Виноград, хурма, фейхоа, мандарины, апельсины, лимоны — всё это растет в нашем саду.
				<br/>
				Когда фрукты еще не поспели, мы можем предложить недорогой мандариновый сок.
		</details>

		<div class="main_service_title">
			Мангал
		</div>
		<details class="main_service_details">
			Всегда доступен большой удобный мангал
		</details>

		<a href=$Page_common.url Page.p_prices$>Все цены</a>
	</aside>
>>
*)

let left () =
	let rec loop = function
		| [] -> []
		| p :: tl ->
			match p.Page.contents_name with
				| Some name -> << <p><a href=$Page.url p.Page.path$>$str:name$</a></p> >> :: loop tl
				| None -> loop tl
	in
	<<
		<aside class="main">
			<h1>Содержание</h1>
			$list:loop !Page.pages$
		</aside>
	>>
	

let center =
	<<
		<div class="tpl_main_center">
			<h1>Добро пожаловать наш в гостевой дом!</h1>
			<p>
				<b>$str:Config.year$!</b> Предлагаем жилье в <b>частном секторе Абхазии</b> без посредников!
			</p>

			$Tpl_img.text_img ~right:true Gallery.We Gallery.we01$

			<p>
				Мы рады приветствовать вас на сайте гостевого дома семьи Минаса и Алины Рогонян! Наш дом расположен
				в курортном поселке Цандрипш республики Абхазия. Поселок находится прямо на берегу Чёрного моря.
				При этом, море у нас заслуженно считается более чистым, чем в Гагре. Это то место, где чистый
				горный воздух предгорий Кавказа соединяется со свежим морским ветром, образуя уникальный микроклимат.
			</p>

			<p>
				Если вы устали от городской суеты, если вы едете с детьми, то наш дом — идеальное место для отдыха!
				В нашем доме не устраивают дискотек до утра, поэтому вы всегда сможете набраться сил для следующего дня на море.
			</p>

			<p>
				Мы постарались сделать сайт, который ответит на все ваши вопросы, покажет все красоты Абхазии, чтобы
				вам оставалось только принять решение о поездке в нашу прекрасную страну.
			</p>

			<p>
				<a href=$str:P_contacts.url$>Звоните</a>, мы постараемся вам помочь. Обратите внимание, что вопросы
				по бронированию, трансферу и прочим организационным моментам лучше всего решать по телефону.
			</p>

			<div class="float_clean"/>

			<div class="main_info">
				<h1>Проживание</h1>
				$Tpl_img.coltitle_img Gallery.Condition Gallery.condition08$
				<p>
					Мы предлагаем проживание в номерах <a href=$Page.url Page.p_prices$>"эконом" и "стандарт" класса</a>. В каждом номере
					есть кровати, шкафы для одежды, тумбочка для мелких вещей, вентилятор. В каждую комнату
					отдельный вход. Есть общая веранда и кухня, где приятно посидеть компанией вечером.
				</p>
			</div>
			<div class="main_info">
				<h1>Экскурсии</h1>
				$Tpl_img.coltitle_img Gallery.Tours Gallery.canyon07$
				<p>
					Абхазия — страна огромных гор, чистых ручьев и древней истории. Прикоснитесь к прекрасному вместе с нами!
				</p>
				<p>
					<a href=$Page.url Page.p_tours$>Подробнее</a>
				</p>
			</div>
		</div>
	>>

include Page.Make (struct
	let contents_name = None

	let title = "Без посредников в частном секторе"

	let path = Page.p_main

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Main ~title ~left:(left ()) center
end)
