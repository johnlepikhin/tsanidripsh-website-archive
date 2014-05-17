
module Html5 = Html5.M

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
				Можем доставить вас из аэропорта Адлера (Сочи), а также от вокзала Цандрипша.
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
				<p>
					Виноград, хурма, фейхоа, мандарины, апельсины, лимоны — всё это растет в нашем саду.
				</p>
				<p>
					Когда фрукты еще не поспели, мы можем предложить недорогой мандариновый сок.
				</p>
			</details>

			<div class="main_service_title">
				Мангал
			</div>
			<details class="main_service_details">
				Всегда доступен большой удобный мангал
			</details>
	</aside>
>>

let center = <<
	<div class="tpl_main_center">
		<p>
			<b>$str:Config.year$!</b> Предлагаем жилье в <b>частном секторе Абхазии</b> без посредников!
		</p>

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
			<a href=$str:P_contacts.url$>Звоните</a>, мы ответим на все ваши вопросы.
		</p>
	</div>
>>

include Page.Make (struct
	let path = Page.p_main

	let doc = Tpl.tpl_base ~position:Tpl.Position.Main ~title:"Без посредников в частном секторе" ~left center
end)
