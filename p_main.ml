
module Html = Tyxml.Html

let left () =
	let rec loop = function
		| [] -> []
		| p :: tl ->
			match p.Page.contents_name with
				| Some name ->
					let href = Page.url p.Page.urls in
					let name = Html.pcdata name in
					[%html "<p><a href="href">"[name]"</a></p>" ] :: loop tl
				| None -> loop tl
	in
	let list_contents = List.sort (fun a b -> compare a.Page.contents_name b.Page.contents_name) !Page.pages |> loop in
	[%html
		"<aside class='main'>
			<h2>Содержание</h2>"
			list_contents
		"</aside>"
	]
	
let articles () =
	let list_articles = Article.articles_list 10 in
	[%html
		"<div>
			<h2>Новое на сайте! Интересные статьи</h2>"
			list_articles
		"</div>"
	]

let attention_new_year =
	let href = Page_common.url Page.p_new_year in
	[%html
	"<div class='attention'>
		<b>Открыто бронирование на <a href="href">новогоднюю ночь!</a></b>
	</div>"
	]

let attention_empty = Html.div []

let center () =
  let season = Html.pcdata Config.season in
  let attention = if Config.is_new_year then attention_new_year else attention_empty in
  let pano360 =
    Tpl_pano360.text_pano360
      ~right:true ~text:"В одном из наших номеров (можно развернуть на весь экран!)"
      Static.pano_room_standard_2beds
  in
  let condition = Tpl_img.coltitle_img (Gallery_static.Tag (Gallery.condition42, Gallery.Condition)) in
  let href_prices = Page.url Page.p_prices in
  let tours_img = Tpl_img.coltitle_img (Gallery_static.Tag (Gallery.canyon07, Gallery.Tours)) in
  let tours_href = Page.url Page.p_tours in
  let condition2_img =
    Tpl_img.text_img
      ~right:true
      ~text:(Printf.sprintf "Отдых в Абхазии, Цандрипш, частный сектор. %s" Config.season)
      (Gallery_static.Tag (Gallery.condition09, Gallery.Condition))
  in
  let sea_img = Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.sea26, Gallery.Sea)) in
  let year = Config.year in
  let articles_list = articles () in
  let contacts_href = P_contacts.urls in
  [%html
	  "<div class='tpl_main_center'>
	   <h1>Приглашаем в Абхазию на летний отдых в Цандрипше</h1>
       <h2>Частный отдых без посредников в Цандрипше у моря</h2>"
	  [attention; pano360]
      "<p>
       Рады приветствовать вас в стране с мягким климатом, девственной природой и вкуснейшей кухней. Мы приглашаем вас остановиться в нашем
       гостевом доме Валента и прочувствовать все прелести жителей небольшого городка. Последние несколько лет, Гагра Абхазия набирает
       широкую популярность среди туристов. Давайте разберёмся, почему?
       </p>
      
       <p>
       Прежде всего, отдых в Абхазии — это озёра, реки и горы, которые располагаются на всей территории. Если вы устали от мегаполиса и
       хотите отдохнуть от городских построек и суеты, вам необходимо окунуться в эту атмосферу. Путешествуя по местности Абхазии, можно
       посмотреть много красивейших мест, в независимости от того, где вы находитесь, на Юге, Востоке или Севере.
       </p>
      
       <p>
       Визитная карточка Цандрипша — «Белые камни». Это единственное место на побережье, где находится дикий пляж со скалами белого цвета, а
       так побережье усыпано мелкими камнями, море очень тёплое.
       </p>
      
       <p>
       Отдых в Абхазии летом — это зелёная природа, прогуливаясь по улицам, можно встретить необычные растения, которые вы не увидите
       в своём городе. Мечта каждого человека — провести отдых наедине с природой, вдали от громких тусовок больших курортных городов.
       </p>
      
       <p>
       В 2019 году отдых в Абхазии вошёл в тройку самых бюджетных стран для отдыха. Основанием для рейтинга послужили цены на билеты из
       России, повседневные расходы, питание и развлечения.
       </p>
      
       <p>
       К счастью, почти каждая семья на сегодняшний день может позволить себе отдых на берегах Абхазии. Близость к российской границе 
       позволяет не тратить время на дорогу, а насладиться прекрасными видами на горы в нескольких километрах от границы.
       </p>
      
       <p>
       Мы приглашаем Вас в наш комфортабельный гостевой дом Валента, который находится в Цандрипше, в шаговой доступности от моря. Каждый 
       день, после сытного завтрака, приятно насладиться свежим воздухом и дойти до пляжа.
       </p>
      
       <p>
       Проживание в частном секторе позволяет готовить еду дома, поэтому продукты питания можно приобретать на местных рынках, там еда 
       сравнительно отличается от туристических мест. Если Вы хотите отдохнуть от бытовых хлопот, тогда можете заказать питание за
       дополнительную плату у нас, ощутив систему «all inclusive».
       </p>
      
       <p>
       На территории гостевого дома царит домашняя атмосфера, здесь можно приготовить ужин на мангале, приятно провести время с семьёй и 
       друзьями.
       </p>
      
       <p>
       Для людей, которые любят активный образ жизни, мы предлагаем экскурсии по самым необыкновенным местам нашего региона. Организуются
       экскурсии по горным рекам, езда на джипах и полёты на парапланах.
       </p>
      
       <p>
       Мы хотим, чтобы каждый смог посмотреть красоты Абхазии, поэтому сделали цены доступные для всех. Каждый может остановиться у нас в 
       Абхазии и снять дом у моря. Чтобы не беспокоиться по прибытии в страну, Вы можете забронировать жилье, а также услугу трансферта до
       гостевого дома. Мы с радостью будем ждать Вас.
       </p>"
       
      "<p>
	   Чтобы снять жилье в Цандрипше,
       <a href="
        contacts_href
        ">позвоните</a> нам. Обратите внимание, что
		 вопросы по бронированию, трансферу и прочим организационным моментам лучше всего решать по телефону.
		 </p>
         
		 <div class='float_clean'></div>
         
		 <div class='main_info'>
		 <h2 class='center'>Проживание</h2>"
	    [condition]
	  "<p>
	   Мы предлагаем проживание в номерах <a href="
      href_prices
      ">«стандарт» класса</a>. В каждом номере
	   есть кровати, шкафы для одежды, тумбочка для мелких вещей, телевизор, вентилятор. В каждую комнату
	   отдельный вход. Есть общая веранда и кухня, где приятно посидеть компанией вечером.
	   </p>
	   </div>
	   <div class='main_info'>
	   <h2 class='center'>Экскурсии</h2>"
	  [tours_img]
	  "<p>
       О, Абхазия — удивительная и древняя страна, хранящая тайны в своих средневековых крепостях и гигантских пещерах. Вызывающая трепетный восторг красотой своих лесов, каньонов и озер. Используй скорее возможность получить этот восторг на наших экскурсиях в Абхазии.
	   </p>
	   <p>
	   <a href="
      tours_href
      ">Подробнее</a>
	   </p>
	   </div>
       
	   <div class='float_clean'></div>
       
	   <h2>Почему лучше обратить внимание на отдых в частном секторе, на Цандрипш?</h2>"
	  [condition2_img]
	  "<ul>
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

	   <div class='float_clean'></div>

	   <h2>Почему отдых в Абхазии?</h2>"
	  [sea_img]
	  "Хотелось бы кратко перечислить, чем отдых в Абхазии ("
      [Html.pcdata year]
      "-й год актуальность) выгодно отличается от отдыха во многих других регионах:
	   <ul>
	   <li>Значительно ниже цены на проживание, питание, экскурсии, внутренний транспорт.</li>

	   <li>Уникальность природы — в гармоничном сочетании Кавказских гор и Черноморского побережья — покорит вас своей красотой и \
       масштабами.
	   А древнейшие памятники культуры и истории, расположенные в известных курортных местах, расскажут вам многое об истории этих мест. И \
       конечно
	   же наличие таких памятников природы, как Новоафонская пещера или Гегский водопад, принуждают многих туристов остановится здесь и \
       получить
	   массу полезной и уникальной информации. Просто загляните на страничку предлагаемых нами экскурсий.
	   </li>

	   <li>Чистейшее море, широкие и не перегруженные пляжи Цандрипша. Температура морской воды в самый жаркий месяц — август достигает +28 \
       С и
	   до октября сохраняется до +18-19 С. А купальный сезон длится с мая по октябрь, но даже зимой в море может искупаться любой желающий
	   и получить не меньше удовольствия. А по своему физико-химическому составу морская вода у берегов близка к минеральной.
	   </li>

	   <li>Удачное расположение курортных мест, ограниченных с одной стороны горами, а с другой — широкой водной поверхностью Черного моря, \
       создает
	   отличный субтропический климат, благодаря которому даже поездка на 3-4 дня не омрачится постоянными тучами. Здесь ощутимо теплее, чем \
       в Сочи.
	   </li>

	   <li>Богатая природа Абхазии. Здесь в естественной среде произрастает более 3500 растений, в том числе и реликтовых (Сосна Пицундская, \
       секвойя,
	   дерево Гинго). Такое разнообразие можно увидеть только здесь. Также произрастает много привнесенных, не свойственных данной местности \
       растений,
	   таких как эвкалипт, акация. Растения выделяют в воздух особые биологические активные вещества — фитоциды, которые дезинфицируют \
       воздух
	   и придают ему особый приятный аромат. Такой климат особенно полезен для людей, страдающих заболеваниями эндокринной, \
       сердечно-сосудистой систем
	   и органов дыхания.
	   </li>

	   <li>Большое разнообразие чистейших, вкусных и полезных фруктов. Каждый месяц есть всегда что-то новое и свежее. Все фрукты выращены \
       без химии,
	   с применением исключительно натуральных удобрений. В этом вы можете легко убедиться, приехав отдыхать в любой сезон.
	   </li>
	   </ul>


	   <div class='float_clean'></div>"
	  [articles_list]
	  "<div class='float_clean'></div>

	   <p>
	   Абхазия. Цандрипш. Отдых в частном секторе. Вам захочется приехать вновь! <a href="contacts_href">Звоните</a>.
			                                                                                                   </p>
		                                                                                                       </div>"
  ]

include Page.Make (struct
	let contents_name = None

 	let title = Config.main_title

	let urls = Page.p_main

	let description =
      "Частный отдых в Абхазии без посредников! ЗАХОДИТЕ: экскурсии, дом или номер на берегу моря Цандрипш, трансферт. Гарантируем отдых на
      100%!"

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Main ~title ~description ~left:(left ()) (center ())
end)
