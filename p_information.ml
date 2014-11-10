
module Html5 = Html5.M

let lst = [
	"Нужна ли виза в Абхазию?",
	<<
		<div>
			Нет, виза для въезда в Абхазию не нужна. Кроме того, для жителей России и других стран СНГ не обязателен и загранпаспорт, <b>можно въехать по внутрироссийскому паспорту</b>.
		</div>
	>>;

	"Какие документы нужны на детей?",
	<<
		<div>
			Необходимо <b>свидетельство о рождении</b> (если ребенок путешествует с обоими родителями).
		</div>
	>>;

	"Какие документы нужны на ребенка, выезжающего без родителей (например, с бабушкой), или с одним из родителей?",
	<<
		<div>
			<b>Требуется нотариально заверенное согласие от обоих родителей</b> плюс свидетельство о рождении.
		</div>
	>>;

	"Как добраться до вас из аэропорта Сочи (Адлера) или от вокзала?",
	<<
		<div>
			Проще всего договориться с нами о встрече. Услуга трансфера стоит:
			<ul>
				<li>от аэропорта: $str:Tpl_prices.to_string Prices.transfer_aeroport$</li>
				<li>от ж/д вокзала Адлера: $str:Tpl_prices.to_string Prices.transfer_railroad$</li>
				<li>от ж/д вокзала Цандрипша: $str:Tpl_prices.to_string Prices.transfer_from_border$</li>
			</ul>
			За эти деньги мы организуем трансфер на легковой машине (вместимость до четырех человек) до границы, плюс от границы до гостевого дома.
			<p>
				Трансфер по территории Абхазии (от границы, либо от ж/д вокзала Сочи) мы предлагаем <b>бесплатно</b>.
			</p>
			<div>
				Если вам удобнее добираться самостоятельно, вы можете сориентироваться по карте, которую можно посмотреть в разделе <a href=$Page_common.url Page.p_contacts$>контактов</a>.
			</div>
		</div>
	>>;


	"Можно ли забронировать номер?",
	<<
		<div>
			Да, такая возможность есть. Предоплата производится наш на счет в Сбербанке. <a href=$str:Page.url Page.p_contacts$>Позвоните</a> нам,
			чтобы согласовать детали.
		</div>
	>>;

	"Какой у вас климат? Когда можно купаться?",
	(
		let img1 = Html5.img ~src:"http://info.weather.yandex.net/gagra/2_white.ru.png" ~alt:"" () in
		let img2 = Html5.img ~src:"http://clck.yandex.ru/click/dtype=stred/pid=7/cid=1227/*http://img.yandex.ru/i/pix.gif" ~alt:"" () in
		<<
			<div>
				<div class="weather_informer">
					<a href="http://clck.yandex.ru/redir/dtype=stred/pid=7/cid=1228/*http://pogoda.yandex.ru/gagra">
						$img1$
						$img2$
					</a>
				</div>
				Высокий сезон в Абхазии начинается с в июне и заканчивается в сентябре. В это время страну посещает максимум туристов (пик приходится на
				июль и август). Но купаться можно и в мае, и в октябре. Просто вода будет не 26°C, а ближе к 20°C.
			</div>
		>>
	);

	"Безопасно ли отдыхать в Абхазии?",
	<<
		<div>
			<p>
				Часто люди думают, что Абхазия — это почти что Чечня, только на море. Но это совсем не так. Войны у нас уже давно нет и только местами пробитые стены в округе Сухума
				напоминают о тех грустных событиях.
			</p>
			<p>
				У нас никто не стреляет, нет людей с автоматами, никто не захватывает людей в рабство. Жители нашей страны прекрасно понимают, что от вас, туристов, зависит
				наша жизнь. Поэтому, напротив, нередко можно оказаться в бесплатной экскурсии, внезапно организованной проходящим мимо местным жителем, который с большой любовью
				поведает вам о достопримечательностях.
			</p>
			<p>
				Тем не менее, считаем необходимым предупретить, что у нас есть воровство (не грабежи!). Будьте внимательны к своим кошелькам на рынках, не оставляйте надолго без личные
				вещи на пляже.
			</p>
		</div>
	>>;
]

let lst =
	let id = ref 0 in
	List.map (fun (a, b) -> incr id; a, b, !id) lst

let left =
	let els = List.map (fun (title, _, id) -> << <p><a href=$str:"#info"^(string_of_int id)$>$str:title$</a></p> >>) lst in
	<<
		<aside>
			<h1>Оглавление</h1>
			$list:els$
		</aside>
	>>

let center =
	let els = List.map (fun (title, answer, id) -> << <div><h2 id=$str:"info"^(string_of_int id)$>$str:title$</h2>$answer$<br/></div> >>) lst in
	<<
		<div class="tpl_main_center">
			$list:els$
		</div>
	>>

include Page.Make (struct
	let title = "Полезная информация"

	let contents_name = Some "Информация, которая вам пригодится"

	let path = Page.p_information

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Information ~title ~left center
end)
