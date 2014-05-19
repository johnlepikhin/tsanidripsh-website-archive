
module Html5 = Html5.M


let html ~title ?(keywords=Config.keywords) ?(description=Config.description) body = <<
	<html>
		<head>
			<title>$str:title$</title>
			<meta charset="utf-8"/>
			<meta name="keywords" content=$str:keywords$/>
			<meta name="description" content=$str:description$/>
			<link rel="stylesheet" href=$str:Static.url Static.css$/>
		</head>
		$body$
	</html>
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
			| Contacts

		let all = [ Main; Gallery; Prices; Tours; Information; Feedbacks; Contacts ]

		let to_url t = 
			let p =
				match t with
					| Main -> Page.p_main
					| Gallery -> Page.p_gallery
					| Prices -> Page.p_prices
					| Tours -> Page.p_tours
					| Information -> Page.p_information
					| Feedbacks -> Page.p_feedbacks
					| Contacts -> Page.p_contacts
			in
			Page.url p
	end

module Main_menu =
	struct
		open Position

		let to_name = function
			| Main -> "Главная"
			| Gallery -> "Фотографии"
			| Prices -> "Цены"
			| Tours -> "Экскурсии"
			| Information -> "Информация"
			| Feedbacks -> "Отзывы о нас"
			| Contacts -> "Контакты"

		let tpl1 position =
			let make_el p =
				if p = position then
					<< <div class="main_menu_el main_menu_el_current">$str:to_name p$</div> >>
				else
					<< <a class="main_menu" href=$str:to_url p$><div class="main_menu_el main_menu_el_selectable">$str:to_name p$</div></a> >>
			in
			let divs = List.map make_el all in
			<< <div class="main_menu">$list:divs$</div> >>

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

let yandex_metrika =
	let script = Html5.cdata_script "
		(function (d, w, c) {
			 (w[c] = w[c] || []).push(function() {
				  try {
						w.yaCounter17405770 = new Ya.Metrika({id:17405770, enableAll: true, webvisor:true});
				  } catch(e) { }
			 });
			 
			 var n = d.getElementsByTagName(\"script\")[0],
				  s = d.createElement(\"script\"),
				  f = function () { n.parentNode.insertBefore(s, n); };
			 s.type = \"text/javascript\";
			 s.async = true;
			 s.src = (d.location.protocol == \"https:\" ? \"https:\" : \"http:\") + \"//mc.yandex.ru/metrika/watch.js\";

			 if (w.opera == \"[object Opera]\") {
				  d.addEventListener(\"DOMContentLoaded\", f);
			 } else { f(); }
		})(document, window, \"yandex_metrika_callbacks\");
	" in
	let noscript = Html5.Unsafe.data "<noscript><div><img src=\"//mc.yandex.ru/watch/17405770\" style=\"position:absolute; left:-9999px;\" alt=\"\" /></div></noscript>" in
	<<
		<div>
			<script>
				$script$
			</script>
			$noscript$
		</div>
	>>

let tpl_base ?page ~title ~position ?keywords ?description ?left center =
	let title = Printf.sprintf "%s — Отдых в Абхазии. %s" title Config.year in
	let main_menu = Main_menu.tpl1 position in
	let main_menu_bottom = Main_menu.tpl2 position in
	let phones = List.map (fun (phone, _) -> << <div>$str:phone$</div> >>) Config.phones in
	let left = match left with
		| None -> << <div/> >>
		| Some el -> << <aside class="tpl_main_left">$el$</aside> >>
	in
	let page = match page with
		| None -> ""
		| Some page -> page
	in
	let script_page = Html5.cdata_script (Printf.sprintf "%s = '%s';" Common_config.page_var page) in
	html ~title ?keywords ?description <<
		<body class="tpl_main" id=$str:Common_config.body$>
			<script>$script_page$</script>
			<div class="tpl_main">
				<script>
						function moveTitle (maxmove, time) {
							e = document.getElementById ('tpl_main_header');
							if (typeof(bgPosX) == "undefined") {
								bgPosX = 800;
								bgPosY = 10;
							}

							e.style.transition = "background-position " + time + "s";
							max_x = e.offsetWidth;
							max_y = 200;
							tmpx = -1;
							tmpy = -1;
							i = 0;
							while (Math.max(tmpx, -1) == -1 || Math.max (tmpy, -1) == -1 || Math.max (tmpx, max_x) == tmpx || Math.max (tmpy, max_y) == tmpy) {
								tmpx = bgPosX + Math.random () * maxmove - maxmove/2;
								tmpy = bgPosY + Math.random () * maxmove - maxmove/2;
								i++;
								if (i == 1000) {
									return;
								}
							}
							e.style.backgroundPosition = "-" + tmpx + "px -" + tmpy + "px";
							bgPosX = tmpx;
							bgPosY = tmpy;
						}

						function moveTitlePeriodically () {
							window.setTimeout("moveTitle (300, 3); moveTitlePeriodically ()", 7000);
						}

						moveTitlePeriodically ();
				</script>
				<div class="tpl_main_header" onclick="moveTitle(2000, 1)" id="tpl_main_header">
					<div class="tpl_main_header_content">
						<a href=$Page.url Page.p_main$>
							<div class="tpl_main_logo">
								<div class="tpl_main_logo_1">
									Частный сектор в Абхазии
								</div>
								<div class="tpl_main_logo_2">
									ЦАНДРИПШ
								</div>
							</div>
						</a>
						<div class="tpl_main_contacts">
							$list:phones$
							<a href=$str:"mailto:" ^ Config.mailto$>$str:Config.mailto$</a>
						</div>
					</div>
				</div>
				<div class="tpl_main_content">
					$main_menu$
					<div class="float_clean"/>
					$left$
					$center$
					<!--
					<div class="main_menu_bottom_container">
						$main_menu_bottom$
					</div>
					-->
				</div>
				<div class="tpl_main_copyright">
					© 2003-$str:let open Unix in string_of_int ((localtime(time ())).tm_year + 1900)$ Минас Рогонян
				</div>
			</div>
			<script src=$Static.url Static.js_main$/>
			$yandex_metrika$
		</body>
	>>

let tpl_redirect path =
	let meta = Html5.Unsafe.data (Printf.sprintf "<meta http-equiv=\"refresh\" content=\"0; url=http://%s%s\" />" Config.site_domain (Page.url path)) in
	<<
		<html>
			<head>
				$meta$
			</head>
		</html>
	>>
