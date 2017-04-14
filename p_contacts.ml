
module Html = Tyxml.Html

let left = <<
	<aside class="main">
	</aside>
>>

let center =
	let script = Html.cdata_script "
		function calcHour () {
			var offset = 4;

			var d = new Date();
			var utc = d.getTime() + (d.getTimezoneOffset() * 60000);
			var nd = new Date(utc + (3600000*offset));

			return nd.getHours();
		}

		function isValidCallTime () {
			var hour = calcHour ();
			if (hour >= 9 && hour < 23) {
				return true;
			}

			return false;
		}

		function fillCallTime (e) {
			if (isValidCallTime ()) {
				e.innerHTML = \" Прямо сейчас хорошее время для звонка, в Абхазии день!\";
			} else {
				e.innerHTML = \" К сожалению, прямо сейчас у нас ночь. Позвоните позже, либо напишите (посмотрите ниже E-mail, адреса ВКонтакте, Одноклассники)\";
			}
		}

		function checkCallTimePeriodically () {
			window.setTimeout ('fillCallTime(document.getElementById(id=\"validCallTime\")); checkCallTimePeriodically();', 60000);
		}
	" in
	let phones = List.map (fun (phone, name, op) -> << <div class="contacts_phone">$str:name$: <a href=$str:"tel:"^phone$>☎</a> $str:phone$ <small>(оператор $str:op$, Россия)</small></div> >>) Config.phones in
	<<
		<div class="tpl_main_center">
			<script>$script$</script>
			<div onmouseover=$Tpl.reachGoal "view_contacts"$>
				<h2>Телефоны для вопросов и бронирования</h2>
				$list:phones$
			</div>
			Номера привязаны к Краснодарскому краю России, стоимость звонка из любого региона около 2-5 рублей. Мы ждем вашего звонка с 9 утра до 11 вечера по Московскому времени.
			<b id="validCallTime"/>
			<script>var el = document.getElementById(id="validCallTime"); fillCallTime(el); checkCallTimePeriodically ();</script>

			<h2>Социальные сети</h2>
			ВКонтакте: <a onmousedown=$Tpl.reachGoal "view_contacts_vkontakte"$ href="https://vk.com/tsandipshhotel">наша группа</a>
			<br/>
			Одноклассники: <a onmousedown=$Tpl.reachGoal "view_contacts_odnoklassniki"$ href="http://www.odnoklassniki.ru/profile/340785123423">Минас Рогонян</a>

			<h2>E-mail</h2>
			<a onmousedown=$Tpl.reachGoal "view_contacts_email"$ href=$str:"mailto:" ^ Config.mailto$>$str:Config.mailto$</a>


			<h2>Карта окрестностей нашего дома</h2>
			<iframe width="100%" height="400" src="https://www.google.com/maps/d/embed?mid=ztnHhEsfVMrg.k2-9qhTfo6k4"/>
			<br/>
			Просмотреть <a href="https://maps.google.com/maps/ms?ie=UTF8&hl=ru&oe=UTF8&msa=0&msid=215654546826584296819.0004a8692b6bc72add6ed&t=h&ll=43.382508,40.051362&spn=0.02344,0.08788&source=embed">на карте большего размера</a>

		</div>
	>>

include Page.Make (struct
	let title = "Контакты"

	let contents_name = Some "Где мы находимся, контакты, карта"

	let path = Page.p_contacts

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Contacts ~title center
end)
