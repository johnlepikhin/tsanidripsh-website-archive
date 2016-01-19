
module Html5 = Html5.M

let yaCounterID = "17405770"

let googleAnalyticsID = "UA-58581213-1"

let reachGoal name = Printf.sprintf "yaCounter%s.reachGoal('%s'); return true;" yaCounterID name

let html ~title ?(keywords=Config.keywords) ?(description=Config.description) body =
	let meta_yandex = Html5.Unsafe.data "<meta name='yandex-verification' content='6cb12c4bf700b317' />" in
	<<
	<html>
		<head>
			<title>$str:title$</title>
			<meta charset="utf-8"/>
			<meta name="keywords" content=$str:keywords$/>
			<meta name="description" content=$str:description$/>
			$meta_yandex$
			<link rel="stylesheet" href=$str:Static.url Static.css$/>
		</head>
		$body$
	</html>
>>

let tpl_banner image alt page =
	let t = Html5.img ~src:(Static.url image) ~alt () in
	<<
		<div class="banner rock">
			<a href=$Page.url page$>
				$t$
				<div class="banner_text">
					$str:alt$
				</div>
			</a>
		</div>
	>>

module Position =
	struct
		type t =
			| Main
			| Gallery
			| Prices
			| Tours
			| Information
			| Feedbacks
			| Questions
			| Contacts

		let all = [ Main; Gallery; Prices; Tours; Information; Feedbacks; Questions; Contacts ]

		let to_url t = 
			let p =
				match t with
					| Main -> Page.p_main
					| Gallery -> Page.p_gallery
					| Prices -> Page.p_prices
					| Tours -> Page.p_tours
					| Information -> Page.p_information
					| Feedbacks -> Page.p_feedbacks
					| Questions -> Page.p_questions
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
			| Tours -> "Туры"
			| Information -> "Информация"
			| Feedbacks -> "Отзывы"
			| Questions -> "Вопросы"
			| Contacts -> "Контакты"

		let tpl1 position =
			let make_el p =
				if p = position then
					<< <a class="main_menu" href=$str:to_url p$><div class="main_menu_el main_menu_el_current">$str:to_name p$</div></a> >>
				else
					<< <a class="main_menu" href=$str:to_url p$><div class="main_menu_el main_menu_el_selectable">$str:to_name p$</div></a> >>
			in
			let els = List.map make_el all in
			<<
				<nav class="main_menu">
					$list:els$
				</nav>
			>>

		let tpl2 position =
			let make_el p =
				if p = position then
					<< <div class="main_menu_bottom_el main_menu_bottom_el_current">$str:to_name p$</div> >>
				else
					<< <a class="main_menu_bottom" href=$str:to_url p$><div class="main_menu_bottom_el main_menu_bottom_el_selectable">$str:to_name p$</div></a> >>
			in
			let divs = List.map make_el all in
			<< <div class="main_menu_bottom">$list:divs$</div> >>
	end

let yandex_metrika = Html5.Unsafe.data (Printf.sprintf "
	<!-- Yandex.Metrika informer -->
	<a href=\"https://metrika.yandex.ru/stat/?id=%s&amp;from=informer\"
	target=\"_blank\" rel=\"nofollow\"><img src=\"//bs.yandex.ru/informer/%s/1_1_8B97DCFF_6B77BCFF_0_pageviews\"
	style=\"width:80px; height:15px; border:0;\" alt=\"Яндекс.Метрика\" title=\"Яндекс.Метрика: данные за сегодня (просмотры)\" onclick=\"try{Ya.Metrika.informer({i:this,id:%s,lang:'ru'});return false}catch(e){}\"/></a>
	<!-- /Yandex.Metrika informer -->

	<!-- Yandex.Metrika counter -->
	<script type=\"text/javascript\">
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

		 var n = d.getElementsByTagName(\"script\")[0],
			  s = d.createElement(\"script\"),
			  f = function () { n.parentNode.insertBefore(s, n); };
		 s.type = \"text/javascript\";
		 s.async = true;
		 s.src = (d.location.protocol == \"https:\" ? \"https:\" : \"http:\") + \"//mc.yandex.ru/metrika/watch.js\";

		 if (w.opera == \"[object Opera]\") {
			  d.addEventListener(\"DOMContentLoaded\", f, false);
		 } else { f(); }
	})(document, window, \"yandex_metrika_callbacks\");
	</script>
	<noscript><div><img src=\"//mc.yandex.ru/watch/%s\" style=\"position:absolute; left:-9999px;\" alt=\"\" /></div></noscript>
	<!-- /Yandex.Metrika counter -->
" yaCounterID yaCounterID yaCounterID yaCounterID yaCounterID yaCounterID)

let googl_analytics = Html5.Unsafe.data ("
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		   })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '" ^ googleAnalyticsID ^ "', 'auto');
    ga('send', 'pageview');

	 </script>
")

let initial_mobile = Html5.Unsafe.data "
<script>
	if (window.innerWidth < 960 || navigator.userAgent.match(/Android|webOS|iPhone|iPad|iPod|BlackBerry|Windows Phone/i)) {
		document.body.className = document.body.className + ' mobile';
	}
</script>
"

let order_button = Html5.Unsafe.data (Printf.sprintf "
	<a href=\"javascript:void( window.open( 'https://form.jotformeu.com/60132832553348', 'blank', 'scrollbars=yes, toolbar=no, width=700, height=500' ) ) \" class=\"btn lightbox-60132832553348 order_button\">
			<div class='order_container'>
				<div class='order_static_container'>
	      		<div class='order_addition'>от %i рублей</div>
			  		Запрос номера
				</div>
			</div>
	</a>
" Prices.live_min)

let order_button_text = Html5.Unsafe.data "
	<a href=\"javascript:void( window.open( 'https://form.jotformeu.com/60132832553348', 'blank', 'scrollbars=yes, toolbar=no, width=700, height=500' ) ) \" class=\"btn lightbox-60132832553348 order_button_text\">
			<div class='order_button_text'>
		  		Заказать номер
			</div>
	</a>
"

type center =  Html5_types.div_content Html5.elt

let tpl_tpl_base
	?(add_class="")
	~title
	~position
	?keywords
	?description
	?(left : Html5_types.div_content Html5.elt option)
	(center : center)
	: [> Html5_types.html ] Html5.elt =
	(*
	let full_title = Printf.sprintf "%s — %s, Цандрипш." title Config.main_title in
	*)
	let main_menu = Main_menu.tpl1 position in
	let main_menu_bottom = Main_menu.tpl2 position in

	let banner =
		if Config.is_new_year then
			tpl_banner Static.christmas_tree "Приглашаем на Новый Год!" Page.p_new_year
		else
			<< <div/> >>
	in

	let phones = List.map (fun (phone, _, op) -> << <div><a href=$str:"tel:"^phone$>☎ $str:phone$</a></div> >>) Config.phones in
	let left = match left with
		| None -> << <div/> >>
		| Some el ->
			<< <aside class="tpl_main_left">$el$</aside> >>
	in
	html ~title:title ?keywords ?description <<
		<body class="tpl_main" id=$str:Id.to_string Id.body$>
			$initial_mobile$
			$banner$
			<div class="tpl_main">
				<div class=$Printf.sprintf "tpl_main_header %s" add_class$ id=$Id.to_string Id.tpl_main_header$>
					<div class="tpl_main_header_content">
						<a href=$Page.url ~shrink_index:true Page.p_main$>
							<div class="tpl_main_logo">
								<div class="tpl_main_logo_1">
									Частный сектор в Абхазии
								</div>
								<div class="tpl_main_logo_2">
									ЦАНДРИПШ
								</div>
							</div>
						</a>
						<div class="tpl_main_contacts" onmouseover=$reachGoal "view_contacts"$>
							$list:phones$
							<a onmousedown=$reachGoal "view_contacts_email"$ href=$str:"mailto:" ^ Config.mailto$>$str:Config.mailto$</a>
						</div>
					</div>
				</div>
				<div class="tpl_main_content">
					$main_menu$
					<div class="float_clean"/>
					$left$

					<h1>$str:title$</h1>
					$center$
					<div class="main_menu_bottom_container">
						$main_menu_bottom$
					</div>
				</div>
				<div class="tpl_main_copyright">
					© 2003-$str:let open Unix in string_of_int ((localtime(time ())).tm_year + 1900)$ Минас Рогонян
					$yandex_metrika$
					$googl_analytics$
				</div>
			</div>
			<div>
				<script src=$Static.url Static.js_main$/>
			</div>
		</body>
	>>

let tpl_base = tpl_tpl_base ~add_class:""
let tpl_base_newyear = tpl_tpl_base ~add_class:"new_year_main_header"

let tpl_redirect path =
	let meta = Html5.Unsafe.data (Printf.sprintf "<meta http-equiv=\"refresh\" content=\"0; url=http://%s%s\" />" Config.site_domain (Page.url path)) in
	<<
		<html>
			<head>
				$meta$
			</head>
		</html>
	>>
