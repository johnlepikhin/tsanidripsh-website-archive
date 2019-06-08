
module Html = Tyxml.Html

let tbl_row = List.map (fun p -> Html.td [Tpl_prices.to_string p] )

let tbl_price ?head = Tbl.simple ~className:"prices" ?head

let tbl_living =
  let make_class_table (name, sizes, prices) =
    let open Prices_make in
    let make_month p =
      if p.month_start = p.month_end then
	Month.to_string p.month_start
      else
	Printf.sprintf "%s-%s" (Month.to_string p.month_start) (Month.to_string p.month_end)
    in
    let months = List.map make_month prices |> List.map Html.pcdata in
    let rec make_sizes = function
      | [] -> ""
      | last :: [] -> Printf.sprintf "или %i" last
      | hd :: tl -> Printf.sprintf "%i %s" hd (make_sizes tl)
    in
    let sizes = if List.length sizes = 1 then Printf.sprintf "%i" (List.hd sizes) else make_sizes sizes in
    let tbl = tbl_price ~head:((Html.pcdata name) :: months) [ [%html "<th> Мест в номере: "[Html.pcdata sizes]"</th>" ] :: (List.map (fun p -> p.price) prices |> tbl_row) ] in
    [%html "<div> <h3>Номера "[Html.pcdata name]"</h3>"[tbl]" * Цены указаны за человека в сутки.</div>" ]
  in
  let classes = List.map make_class_table Prices_make.agregated_live in
  Html.div classes


let tbl_transfer = tbl_price [
    [%html "<th>Из аэропорта Адлера, за машину</th>" ] :: tbl_row [Prices.transfer_aeroport];
    [%html "<th>От ж/д вокзала Адлера, за машину</th>" ] :: tbl_row [Prices.transfer_railroad];
    [%html "<th>От границы (встреча), за машину</th>" ] :: tbl_row [Prices.transfer_from_border];
    [%html "<th>От ж/д вокзала Цандрипша, за машину</th>" ] :: tbl_row [Prices.transfer_from_border];
    [%html "<th>До границы (проводы), за машину</th>" ] :: tbl_row [Prices.transfer_to_border];
    [%html "<th>До аэропорта/вокзала Адлера, за машину<br/>помощь с багажом на границе</th>" ] :: tbl_row [Prices.transfer_to_aeroport];
  ]

let tbl_tours = tbl_price [
    [%html "<th>Озеро рица <br/> (без учета стоимости входного билета)</th>" ] :: tbl_row [Prices.tour_riza];
    [%html "<th>Новоафонская пещера <br/> (без учета стоимости входного билета)</th>" ] :: tbl_row [Prices.tour_cave];
    [%html "<th>Сухумский ботанический сад + обезьяний питомник <br/> (без учета стоимости входного билета)</th>" ] :: tbl_row [Prices.tour_sukhum];
    [%html "<th>Цандрипшский каньон</th>" ] :: tbl_row [Prices.tour_canyon];
    [%html "<th>Оба Цандрипшских каньона, с рыбалкой</th>" ] :: tbl_row [Prices.tour_canyon2];
    [%html "<th>Конные прогулки, 3 часа с инструктором</th>" ] :: tbl_row [Prices.tour_horses];
    [%html "<th>Альпийские луга Кавказа</th>" ] :: tbl_row [Prices.tour_alps];
    [%html "<th>Альпийские луга Кавказа с пикником</th>" ] :: tbl_row [Prices.tour_alps_bbq];
  ]

let not_offer =
  [%html{|
<a href="#not_offer" title="Смотрите под таблицей условия">*</a>
|}]

let tbl_food = tbl_price [
    [%html "<th>Вино, за полтора литра "[not_offer]"</th>" ] :: tbl_row [250];
    [%html "<th>Чача, за поллитра "[not_offer]"</th>" ] :: tbl_row [200];
    [%html "<th>Мандариновый сок, за три литра "[not_offer]"</th>" ] :: tbl_row [200];
    [%html "<th>Сок фейхоа, за три литра "[not_offer]"</th>" ] :: tbl_row [200];
    [%html "<th>Мандарины, кг "[not_offer]"</th>" ] :: tbl_row [100];
    [%html "<th>Хурма, кг "[not_offer]"</th>" ] :: tbl_row [100];
    [%html "<th>Фейхоа, кг "[not_offer]"</th>" ] :: tbl_row [100];
  ]

let tbl_other = tbl_price [
    [%html "<th>Wi-Fi, в сутки с комнаты<br/>(просим не качать торенты и фильмы)</th>" ] :: tbl_row [Prices.wifi_per_room];
    [%html "<th>Место для вашей машины</th>" ] :: tbl_row [0];
    [%html "<th>Большой мангал</th>" ] :: tbl_row [0];
    [%html "<th>Пользование оборудованной кухней</th>" ] :: tbl_row [0];
  ]

let meals3_price = Tpl_prices.to_string Prices.meals3
let meals2_price = Tpl_prices.to_string Prices.meals2
let sauna_price = Tpl_prices.to_string Prices.sauna
let rooms_tour_href = Page_common.url Page.p_rooms_tour
let rooms_href = Page_common.url Page.p_rooms
let billing_href = Page_common.url Page.p_billing
let contacts_href = Page_common.url Page.p_contacts
let tours_href = Page_common.url Page.p_tours

let lst = [
  "Проживание",
  (let pano360 = Tpl_pano360.text_pano360 ~right:true ~text:"В одном из наших номеров (можно развернуть на весь экран!)" Static.pano_room_economic_4beds in
   [%html
     "<div class='prices_main'>"
       [pano360]
       "<p>
Наш гостевой дом расположен в прибрежной части курортного поселка Цандрипш Гагринского района Абхазии. Дом находится
в достаточной удаленности от магистралей и шумных кафе, но при этом близко к морю — это идеальное место для отдыха в дали от городской суеты.
В доме номера <b>стандарт</b> класса. В номерах 1,5 спальные кровати по количеству проживающих, кондиционер, холодильник, телевизор, тумбочки, шкаф для одежды.
Номера с ремонтом. <b>На этаже</b> есть душевые, туалеты, умывальники.
</p>

<p>
К услугам отдыхающих:
</p>
<ul>
<li><b>Дети до 5 лет бесплатно</b> — если не занимают отдельного места</li>
<li><b>Бесплатный Wi-Fi</b> на скорости до 7 мегабит (просим не качать торренты и фильмы, чтобы канала хватило всем гостям);</li>
<li><b>питание в нашей столовой: трёхразовое за "[meals3_price]" и двухразовое (завтра+ужин) за "[meals2_price]"</b>;</li>
<li>кухня со всем необходимым;</li>
<li>горячая и холодная вода круглосуточно;</li>
<li>спутниковое телевидение;</li>
<li>парковка во дворе;</li>
<li>мангал.</li>
</ul>
<p>
Есть общие площадки с видом на море, где приятно провести обеденное время. В шаговой доступности от дома – несколько столовых и кафе с домашней кухней. Чистый
широкий пляж, потрясающие виды на горы. До моря 750 метров, это 6-7 минут пешком.
</p>"

       [tbl_living]

       "<p>
Подробно ознакомиться с номерами можно на <a href="rooms_tour_href">3D-туре по номерам</a> и на <a href="rooms_href">специальной странице</a>.
</p>
<p>
Возможны индивидуальные скидки. Предоставляем возможность <a href="billing_href">забронировать номер</a> с предварительной оплатой на наш счет в Сбербанке. В дальнейшем бронь пойдет в оплату номера. <b>Внимание! В случае отказа от заселения, бронь не возвращается!</b>
<a href="contacts_href">Позвоните</a>, чтобы узнать подробности.
</p>
</div>"
   ]);

  "Трансфер",
  [%html
    "<div class='prices_main'>
<p>
Для вашего комфорта, мы предоставляем услугу трансфера как по территории России, так и в Абхазии. Своих гостей мы возим на комфортном современном
транспорте со всеми удобствами.
</p>"
      [tbl_transfer]
      "</div>"
  ];

  "Туры",
  (let main_img = Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.afon04, Gallery.Tours)) in
   [%html
     "<div class='prices_main'>"
       [main_img]
       "<p>
Абхазия — древняя и удивительная страна. В ней можно увидеть крепости раннего средневековья, побывать в гигантских пещерах или увидеть мир с высоты птичьего полета.
Мы предлагаем вам <a href="tours_href">взглянуть на эти красоты</a>.
</p>"
       [tbl_tours]
       "<p>
Есть возможность получить скидку — 100 рублей с каждого человека — при <a href="billing_href">бронировании заранее</a>.
</p>
</div>"
   ]);

  "Напитки и еда",
  (let main_img = Tpl_img.text_img ~right:true ~text:"Молодое вино, которое к сезону будет окончательно готово." (Gallery_static.Tag (Gallery.wine02, Gallery.Wine)) in
   [%html
     "<div class='prices_main'>"
       [main_img]
       "<p>
Ежегодно мы создаем вкуснейшие напитки для своих гостей. Вино, чача (виноградная водка), мандариновый сок. Всё это делаем из урожая собственного фруктового сада.
</p>"
       [tbl_food]
       "<p id='not_offer'>* Цены на фрукты и напитки указаны ориентировочно, просьба не считать это публичной офертой. Также следует учесть, что их наличие зависит от сезона.</p>
</div>"
   ]);

  "Баня",
  [%html
    "<div class='prices_main'>
<p>
К сожалению, у нас пока нет своей бани. Но буквально в 100 метрах от \
     нашего дома у нас есть дружественная баня, которая для наших \
     гостей готова предложить баню по "[sauna_price]" за группу в час.
</p>
</div>"
  ];

  "Прочие услуги",
  tbl_other;
]

let lst =
  let id = ref 0 in
  List.map (fun (a, b) -> incr id; a, b, !id) lst

let left =
  let els = List.map (fun (title, _, id) ->
      let href = "#info"^(string_of_int id) in
      [%html "<p><a href="href">"[Html.pcdata title]"</a></p>" ]) lst
  in
  [%html
    "<aside class='main'>
<h2>Содержание</h2>"
      els
      "</aside>"
  ]

let center =
  let els = List.map (fun (title, answer, id) ->
      let href = "#info"^(string_of_int id) in
      [%html "<div><h2 id="href">"[Html.pcdata title]"</h2>"[answer]"<br/></div>" ]) lst
  in
  [%html "<div class='tpl_main_center'>"els"</div>" ]

include Page.Make (struct
    let title = "Цены"

    let contents_name = Some (Config.season ^ ". Полный прайслист.")

    let urls = Page.p_prices

    let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title ~left center
  end)
