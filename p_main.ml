
module Html5 = Html5.M

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
			<h2>Содержание</h2>
			$list:List.sort (fun a b -> compare a.Page.contents_name b.Page.contents_name) !Page.pages |> loop$
		</aside>
	>>
	
let articles () =
	<<
		<div>
			<h2>Новое на сайте! Интересные статьи</h2>
			$list:Article.articles_list 10$
		</div>
	>>

let attention_new_year = <<
	<div class="attention">
		<b>Открыто бронирование на <a href=$Page_common.url Page.p_new_year$>новогоднюю ночь!</a></b>
	</div>
>>

let attention_empty = << <div/> >>

let center () =
	let video = Html5.Unsafe.data "<iframe class=\"youtube\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/0cb0K28EkEg\" frameborder=\"0\" allowfullscreen></iframe>" in
	<<
		<div class="tpl_main_center">
			<p>
				<b>$str:Config.season$!</b> Предлагаем <b>жилье в частном секторе Абхазии без посредников</b>!
			</p>
			$if Config.is_new_year then attention_new_year else attention_empty$

			$Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.we04, Gallery.We))$

			<p>
				Мы рады приветствовать вас на сайте гостевого дома семьи Минаса и Алины Рогонян! Наш дом расположен
				в курортном поселке Цандрипш республики Абхазия, близ известного пляжа <b>Белые скалы</b>. Поселок находится
				прямо на берегу Чёрного моря. При этом, море у нас заслуженно считается более чистым, чем в Гагре. Это
				то место, где чистый горный воздух предгорий Кавказа соединяется со свежим морским ветром, образуя
				уникальный микроклимат.
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
				<b>Чтобы снять жилье в Цандрипше</b>, <a href=$str:P_contacts.url$>звоните</a> нам. Обратите внимание, что
				вопросы по бронированию, трансферу и прочим организационным моментам лучше всего решать по телефону.
			</p>

			<div class="float_clean"/>

			<div class="main_info">
				<h2 class="center">Проживание</h2>
				$Tpl_img.coltitle_img (Gallery_static.Tag (Gallery.condition42, Gallery.Condition))$
				<p>
					Мы предлагаем проживание в номерах <a href=$Page.url Page.p_prices$>"стандарт" класса</a>. В каждом номере
					есть кровати, шкафы для одежды, тумбочка для мелких вещей, телевизор, вентилятор. В каждую комнату
					отдельный вход. Есть общая веранда и кухня, где приятно посидеть компанией вечером.
				</p>
			</div>
			<div class="main_info">
				<h2 class="center">Экскурсии</h2>
				$Tpl_img.coltitle_img (Gallery_static.Tag (Gallery.canyon07, Gallery.Tours))$
				<p>
					<b>Абхазия</b> — страна огромных гор, чистых ручьев и древней истории. Прикоснитесь к прекрасному вместе с нами!
				</p>
				<p>
					<a href=$Page.url Page.p_tours$>Подробнее</a>
				</p>
			</div>

			<div class="float_clean"/>

			<h2>Почему лучше обратить внимание на отдых в частном секторе, на Цандрипш?</h2>
			$Tpl_img.text_img ~right:true ~text:(Printf.sprintf "Отдых в Абхазии, Цандрипш, частный сектор. %s" Config.season) (Gallery_static.Tag (Gallery.condition09, Gallery.Condition))$
			<ul>
				<li>Частный сектор Цандрипша — отличное место для отдыха с детьми. Тишина, сады, природа. Дети увидят много необычных для них животных, жучков, увидят как растут и спеют
					их любимые фрукты.
				</li>
				<li>Частный сектор в Цандрипше позволяет снять жилье дешево, при этом предоставляет весь сервис. Это позволяет съездить на море не на несколько дней, как в гостиницах,
					а на длительный срок.</li>
				<li>Цандрипш — идеальное место отдыха для тех, кто любит единение с природой, тишину и покой.</li>
				<li>Для отдыха в нашем доме мы предоставляем оборудованную кухню для тех, кому не нравится много дней подряд спускать деньги в кафе и ресторанах.</li>
				<li>Это удобное место для поездок на экскурсии. Отсюда начинаются экскурсии по всей стране, во все её уголки. Мы и сами предлагаем немало туров для наших гостей.</li>
				<li>Наш поселок находится совсем недалеко от границы с Россией, однако пляжи гораздо чище, чем в Сочи. Это позволяет при необходимости за 2-4 часа съездить в Сочи
					и вернуться обратно. Кстати, с нашей терассы видно стадион Фишт и другие объекты Олимпиады!
				</li>
				<li>В Цандрипше есть вся необходимая для туристов инфраструктура. Магазины, сувенирные лавки, экскурсионные бюро, аптеки, много кафе на любой вкус, клубы.</li>
			</ul>

			<div class="float_clean"/>

			<h2>Почему отдых в Абхазии?</h2>
			$Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.sea26, Gallery.Sea))$
			Хотелось бы кратко перечислить, чем отдых в Абхазии ($str:Config.year$-й год актуальность) выгодно отличается от отдыха во многих других регионах:
			<ul>
				<li>Значительно ниже цены на проживание, питание, экскурсии, внутренний транспорт.</li>

				<li>Уникальность природы — в  гармоничном сочетании Кавказских гор и Черноморского побережья — покорит вас своей красотой и масштабами.
					А древнейшие памятники культуры и истории, расположенные в известных курортных местах, расскажут вам многое об истории этих мест. И конечно
					же наличие таких памятников природы, как Новоафонская пещера или Гегский водопад, принуждают многих туристов остановится здесь и получить
					массу полезной и уникальной информации. Просто загляните на страничку предлагаемых нами экскурсий.
				</li>

				<li>Чистейшее море, широкие и не перегруженные пляжи Цандрипша. Температура морской воды в самый жаркий месяц — август достигает +28 С и
					до октября сохраняется до +18-19 С. А купальный сезон длится с мая по октябрь, но даже зимой в море может искупаться любой желающий
					и получить не меньше удовольствия. А по своему физико-химическому составу морская вода у берегов близка к минеральной.
				</li>

				<li>Удачное расположение курортных мест, ограниченных с одной стороны горами, а с другой — широкой водной поверхностью Черного моря, создает
					отличный субтропический климат, благодаря которому даже поездка на 3-4 дня не омрачится постоянными тучами. Здесь ощутимо теплее, чем в Сочи.
				</li>

				<li>Богатая природа Абхазии. Здесь в естественной среде произрастает более 3500 растений, в том числе и реликтовых (Сосна Пицундская, секвойя,
					дерево Гинго). Такое разнообразие можно увидеть только здесь. Также произрастает много привнесенных, не свойственных данной местности растений,
					таких как эвкалипт, акация. Растения выделяют в воздух особые биологические активные вещества — фитоциды, которые дезинфицируют воздух
					и придают ему особый приятный аромат. Такой климат особенно полезен для людей, страдающих заболеваниями эндокринной, сердечно-сосудистой систем
					и органов дыхания.
				</li>

				<li>Большое разнообразие чистейших, вкусных и полезных фруктов. Каждый месяц есть всегда что-то новое и свежее. Все фрукты выращены без химии,
					с применением исключительно натуральных удобрений. В этом вы можете легко убедиться, приехав отдыхать в любой сезон.
				</li>
			</ul>


			<div class="float_clean"/>

			<div class="text_video">
				$video$
			</div>

			<div class="float_clean"/>

			$articles ()$

			<div class="float_clean"/>

			<p>
				<b>Абхазия. Цандрипш. Отдых в частном секторе.</b> Вам захочется приехать вновь! <a href=$str:P_contacts.url$>Звоните</a>.
			</p>
		</div>
	>>

include Page.Make (struct
	let contents_name = None

	let title = Config.main_title

	let path = Page.p_main

	let description = Config.description ^ ". Наш гостевой дом расположен в частном секторе курортного поселка Цандрипш. Мы предоставляем около 20 комфортных номеров вместимостью от 2 мест. До моря 5 минут, рядом
кафе и магазины"

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Main ~title ~description ~left:(left ()) (center ())
end)
