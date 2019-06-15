
module Html = Tyxml.Html

let yaCounterID = "17405770"

let googleAnalyticsID = "UA-58581213-1"

let reachGoal name = Printf.sprintf "yaCounter%s.reachGoal('%s'); return true;" yaCounterID name

let html ~title ?(keywords=Config.keywords) ?(description=Config.description) body =
	let headers = Html.[
		meta ~a:[a_charset "utf-8"] ();
		meta ~a:[a_name "keywords"; a_content keywords] ();
		meta ~a:[a_name "description"; a_content description] ();
		meta ~a:[a_name "yandex-verification"; a_content "6cb12c4bf700b317"] ();
		link ~rel:[`Stylesheet] ~href:(Static.url Static.css) ();
	] in
	Html.html ~a:[Html.a_lang "ru"] (Html.head (Html.title (Html.pcdata title)) headers) body

let tpl_banner image alt page : [> Html_types.div ] Html.elt =
	let t = Html.img ~src:(Static.url image) ~alt () in
	let page_url = Page.url page in
	[%html"<div class='banner rock'>
					<a href="page_url">"
						[t]
						"<div class='banner_text'>
							"[Html.pcdata alt]"
						</div>
					</a>
				</div>"]

module Position =
	struct
		type t =
			| Main
			| Gallery
			| Prices
			| Information
			| Feedbacks
			| Questions
			| Blog
			| Contacts

		let all = [ Main; Gallery; Prices; Information; Feedbacks; Questions; Blog; Contacts ]

		let to_url t = 
			let p =
				match t with
					| Main -> Page.p_main
					| Gallery -> Page.p_gallery
					| Prices -> Page.p_prices
					| Information -> Page.p_information
					| Feedbacks -> Page.p_feedbacks
					| Questions -> Page.p_questions
					| Blog -> Page.p_blog
					| Contacts -> Page.p_contacts
			in
			Page.url ~shrink_index:true p
	end

module Main_menu =
	struct
		open Position

		let to_name = function
			| Main -> "Главная"
			| Gallery -> "Фотографии"
			| Prices -> "Цены"
			| Information -> "Информация"
			| Feedbacks -> "Отзывы"
			| Questions -> "Вопросы"
			| Blog -> "Блог"
			| Contacts -> "Контакты"

		let tpl1 position =
			let make_el p =
				let name = Html.pcdata (to_name p) in
				let url = to_url p in
				if p = position then
					[%html"<a class='main_menu' href="url"><div class='main_menu_el main_menu_el_current'>"[name]"</div></a>"]
				else
					[%html"<a class='main_menu' href="url"><div class='main_menu_el main_menu_el_selectable'>"[name]"</div></a>"]
			in
			let els = List.map make_el all in
			[%html"<nav class='main_menu'>"els"</nav>"]

		let tpl2 position =
			let make_el p =
				let name = Html.pcdata (to_name p) in
				let url = to_url p in
				if p = position then
					[%html"<div class='main_menu_bottom_el main_menu_bottom_el_current'>"[name]"</div>"]
				else
					[%html"<a class='main_menu_bottom' href="url"><div class='main_menu_bottom_el main_menu_bottom_el_selectable'>"[name]"</div></a>"]
			in
			let divs = List.map make_el all in
			[%html"<div class='main_menu_bottom'>"divs"</div>"]
	end

let yandex_metrika = Html.Unsafe.data (Printf.sprintf "
	<!-- Yandex.Metrika informer -->
	<a href='https://metrika.yandex.ru/stat/?id=%s&amp;from=informer'
	target='_blank' rel='nofollow'><img src='//bs.yandex.ru/informer/%s/1_1_8B97DCFF_6B77BCFF_0_pageviews'
	style='width:80px; height:15px; border:0;' alt='Яндекс.Метрика' title='Яндекс.Метрика: данные за сегодня (просмотры)' onclick='try{Ya.Metrika.informer({i:this,id:%s,lang:\"ru\"});return false}catch(e){}'/></a>
	<!-- /Yandex.Metrika informer -->

	<!-- Yandex.Metrika counter -->
	<script>
	(function (d, w, c) {
		 (w[c] = w[c] || []).push(function() {
			  try {
					w.yaCounter%s = new Ya.Metrika({id:%s,
							  webvisor:true,
							  clickmap:true,
							  trackLinks:true,
							  accurateTrackBounce:true});
			  } catch(e) { }
		 });

		 var n = d.getElementsByTagName('script')[0],
			  s = d.createElement('script'),
			  f = function () { n.parentNode.insertBefore(s, n); };
		 s.type = 'text/javascript';
		 s.async = true;
		 s.src = (d.location.protocol == 'https:' ? 'https:' : 'http:') + '//mc.yandex.ru/metrika/watch.js';

		 if (w.opera == '[object Opera]') {
			  d.addEventListener('DOMContentLoaded', f, false);
		 } else { f(); }
	})(document, window, 'yandex_metrika_callbacks');
	</script>
	<noscript><div><img src='//mc.yandex.ru/watch/%s' style='position:absolute; left:-9999px;' alt='' /></div></noscript>
	<!-- /Yandex.Metrika counter -->
" yaCounterID yaCounterID yaCounterID yaCounterID yaCounterID yaCounterID)

let googl_analytics = Html.Unsafe.data ("
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		   })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '" ^ googleAnalyticsID ^ "', 'auto');
    ga('send', 'pageview');

	 </script>
")

let initial_mobile = Html.Unsafe.data "
<script>
	if (window.innerWidth < 960 || navigator.userAgent.match(/Android|webOS|iPhone|iPad|iPod|BlackBerry|Windows Phone/i)) {
		document.body.className = document.body.className + ' mobile';
	}
</script>
"

let order_button = Html.Unsafe.data (Printf.sprintf "
	<a href='javascript:void( window.open( 'https://form.jotformeu.com/60132832553348', 'blank', 'scrollbars=yes, toolbar=no, width=700, height=500' ) ) ' class='btn lightbox-60132832553348 order_button'>
			<div class='order_container'>
				<div class='order_static_container'>
	      		<div class='order_addition'>от %i рублей</div>
			  		Запрос номера
				</div>
			</div>
	</a>
" Prices.live_min)

let order_button_text = Html.Unsafe.data "
	<a href='javascript:void( window.open( 'https://form.jotformeu.com/60132832553348', 'blank', 'scrollbars=yes, toolbar=no, width=700, height=500' ) ) ' class='btn lightbox-60132832553348 order_button_text'>
			<div class='order_button_text'>
		  		Заказать номер
			</div>
	</a>
"

let www_clean_redirect = Html.Unsafe.data (Printf.sprintf "
<script>
if (window.location.hostname.match(/^www/)) {
	window.location.assign('http://%s' +  window.location.pathname);
}
</script>
" Config.site_domain)

type center =  Html_types.div_content Html.elt

let tpl_tpl_base
	?(add_class="")
	~title
	~position
	?keywords
	?description
	?(left : Html_types.div_content Html.elt option)
	(center : center)
	: [> Html_types.html ] Html.elt =
	(* let full_title = Printf.sprintf "%s — %s, Цандрипш." title Config.main_title in *)
	let full_title = title in
	let main_menu = Main_menu.tpl1 position in
	let main_menu_bottom = Main_menu.tpl2 position in
	let banner =
		if Config.is_new_year then
			tpl_banner Static.christmas_tree "Приглашаем на Новый Год!" Page.p_new_year
		else
			Html.div []
	in

	let phones = List.map (fun (phone, _, op) ->
			let href = "tel:" ^ phone in
			[%html"<div><a href="href">☎ "[Html.pcdata phone]"</a></div>"]
		) Config.phones in
	let left = match left with
		| None -> [%html{| <div></div> |}]
		| Some el ->
			[%html"<aside class='tpl_main_left'>"[el]"</aside>"]
	in
	let class_of_header = Printf.sprintf "tpl_main_header %s" add_class in
	let id_of_header = Id.to_string Id.tpl_main_header in
	let url_of_main_page = Page.url ~shrink_index:true Page.p_main in
	let action_of_contacts = reachGoal "view_contacts" in
	let action_of_email = reachGoal "view_contacts_email" in
	let current_year =
		let open Unix in
		string_of_int ((localtime(time ())).tm_year + 1900)
	in
	let js_main_url = Static.url Static.js_main in
	let mailto = Config.mailto in
	let mailtourl = "mailto:" ^ mailto in
	html ~title:full_title ?keywords ?description (Html.body ~a:[Html.a_class ["tpl_main"]; Html.a_id (Id.to_string Id.body)] [%html
			[www_clean_redirect; initial_mobile;
			banner]
			"<div class='tpl_main'>
				<div class="[class_of_header]" id="id_of_header">
					<div class='tpl_main_header_content'>
						<a href="url_of_main_page">
							<div class='tpl_main_logo'>
								<div class='tpl_main_logo_1'>
									гостевой дом
								</div>
								<div class='tpl_main_logo_2'>
									ВАЛЕНТА
								</div>
								<div class='tpl_main_logo_3'>
									частный сектор в Абхазии
								</div>
							</div>
						</a>
						<div class='tpl_main_contacts' onmouseover="action_of_contacts">"
							phones
							"<a onmousedown="action_of_email" href=" mailtourl ">"[Html.pcdata mailto]"</a>
						</div>
					</div>
				</div>
				<div class='tpl_main_content'>"
					[main_menu]
					"<div class='float_clean'></div>"
					[left]
					[center]
					"<div class='main_menu_bottom_container'>"
						[main_menu_bottom]
					"</div>
				</div>
				<div class='tpl_main_copyright'>
					© 2003-"[Html.pcdata current_year]" Минас Рогонян"
					[yandex_metrika;
					googl_analytics]
				"</div>
			</div>
			<div>
				<script src="js_main_url"> </script>
			</div>"
	])

let tpl_base = tpl_tpl_base ~add_class:""
let tpl_base_newyear = tpl_tpl_base ~add_class:"new_year_main_header"

let tpl_redirect path =
	let meta = Html.Unsafe.data (Printf.sprintf "<meta charset='utf-8'><meta http-equiv='refresh' content='0; url=http://%s%s' />" Config.site_domain (Page.url path)) in
	Html.html (Html.head (Html.title (Html.pcdata "")) [meta]) (Html.body [])
