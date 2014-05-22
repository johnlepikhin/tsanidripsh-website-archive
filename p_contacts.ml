
module Html5 = Html5.M

let left = <<
	<aside class="main">
	</aside>
>>

let center =
	let script = Html5.cdata_script "
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
	let phones = List.map (fun (phone, name, op) -> << <div class="contacts_phone">$str:name$: $str:phone$ <small>(оператор $str:op$, Россия)</small></div> >>) Config.phones in
	<<
		<div class="tpl_main_center">
			<script>$script$</script>
			<h2>Телефоны для вопросов и бронирования</h2>
			$list:phones$
			<br/>
			Номера привязаны к Краснодарскому краю России, стоимость звонка из любого региона около 2-5 рублей. Мы ждем вашего звонка с 9 утра до 11 вечера по Московскому времени.
			<b id="validCallTime"/>
			<script>var el = document.getElementById(id="validCallTime"); fillCallTime(el); checkCallTimePeriodically ();</script>

			<h2>Социальные сети</h2>
			ВКонтакте: <a href="http://vk.com/id51333406">Минас Рогонян</a>
			<br/>
			Одноклассники: <a href="http://www.odnoklassniki.ru/profile/340785123423">Минас Рогонян</a>

			<h2>E-mail</h2>
			<a href=$str:"mailto:" ^ Config.mailto$>$str:Config.mailto$</a>

			<h2>Наш адрес</h2>
			Абхазия, Гагринский район, Цандрипш, ул.Нагорная, д.21

			<h2>Карта нашего дома и его окрестностей</h2>
			<iframe width="100%" height="400" src="https://maps.google.com/maps/ms?ie=UTF8&&;hl=ru&&oe=UTF8&&msa=0&&msid=215654546826584296819.0004a8692b6bc72add6ed&&t=h&&ll=43.382508,40.051362&&spn=0.02344,0.08788&&iwloc=0004a8693b5ef40b1a3cf&&output=embed"/>
			<br/>
			Просмотреть <a href="https://maps.google.com/maps/ms?ie=UTF8&hl=ru&oe=UTF8&msa=0&msid=215654546826584296819.0004a8692b6bc72add6ed&t=h&ll=43.382508,40.051362&spn=0.02344,0.08788&source=embed">наш дом</a> на карте большего размера
		</div>
	>>

include Page.Make (struct
	let title = "Наши контакты"

	let contents_name = Some "Где мы находимся, контакты, карта"

	let path = Page.p_contacts

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Contacts ~title center
end)
