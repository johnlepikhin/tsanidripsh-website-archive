
module Html = Tyxml.Html

type t = {
  str_id : string;
  title : string;
  descr : string;
  preview : Html_types.div_content Html.elt;
  text : Html_types.div_content Html.elt;
  page : Page.t;
}

let gen_tour_doc title descr preview text =
  Tpl.tpl_base ~title ~position:Tpl.Position.Main ~description:descr [%html
    "<div class='tpl_main_center'>
            <h1>"[Html.pcdata title]"</h1>
            <b>"[Html.pcdata descr]"</b>"
      [preview;
       text]
      "</div>"
  ]

let lst = List.map (fun (url, str_id, title, descr, preview, text) ->
    let doc () = gen_tour_doc title descr preview text in
    let page = Page.anonymous ~contents_name:(Printf.sprintf "Экскурсия: %s" descr) url doc title in
    { str_id; title; descr; preview; text; page }
  ) Tours.lst

let left =
  let lst = List.map (fun t ->
      let href = Printf.sprintf "#tour_%s" t.str_id in
      let title = t.title in
      [%html "<p><a href="href">"[Html.pcdata title]"<br></a></p>" ] ) lst
  in
  [%html "<aside class='main'><h1>Оглавление</h1>"lst"</aside>" ]

let center =
  let lst = List.map (fun t ->
      let tour_href = Printf.sprintf "tour_%s" t.str_id in
      let title = t.title in
      let descr = t.descr in
      let preview = t.preview in
      let read_href = Page.url t.page.Page.urls in
      [%html
        "<div>
                    <h2 id="tour_href">"[Html.pcdata title]"</h2>
                    <b>"[Html.pcdata descr]"</b>"
          [preview]
          "<p>
                        <a href="read_href">Читать дальше &gt;&gt;&gt;</a>
                    </p>
                    <div class='float_clean'></div>
                </div>"
      ]
    ) lst
  in
  [%html "<div class='tpl_main_center'>
          <h1>Достопримечательности Кавказа</h1>"
      lst
      "
       <div>

       Бронирование номера в гостевом доме Валента, как сделать? Ничего сложного:
       <ul>
       <li>Количество дней проживания умножаете на количество людей и стоимость номера с человека в сутки</li>
       <li>Полученную сумму переводите на нашу карту Сбербанка</li>
       <li>Номер карты 4276 3000 1138 303</li>
       </ul>

       Обратите особое внимание — бронирование является невозвратным! Это означает, что в случает отказа от заезда по любым причинам, \
       денежные средства за бронирование не возвращаются!
       Что Вы получаете при бронировании?

       <ul>
       <li>Гарантию того, что номер закреплен за Вами в указанные даты Вашего отдыха</li>
       <li>Наше внимание и желание сделать Ваш отдых незабываемым!</li>
       </ul>
       Мы ждем Вас!
       <br/>
       Как забронировать экскурсию от гостевого дома «Валента»? Все просто:
       <ul>
       <li>Определиться с датой, когда Вы хотите поехать на экскурсию</li>
       <li>Определиться с маршрутом экскурсии</li>
       <li>Сделать оплату экскурсии в размере 50% на нашу карту Сбербанка</li>
       <li>Номер карты 4276 3000 1138 303</li>
       </ul>
       Этим Вы поможете нам:
       <ul>
       <li>Заранее сформировать план поездок</li>
       <li>Подготовить транспорт и гида</li>
       <li>Сделать Вашу экскурсию максимально комфортной</li>
       </ul>
       Мы будем очень признательны и благодарны Вам за бронирование и сделаем скидку в количестве 100 р. с человека.


       </div>
       </div>" ]

include
  Page.Make
    (struct
      let title = "Экскурсии в Абхазии. Экускурсии Цандрипш.  Гостевой дом Валента"
                
      let description = "Экскурсия на Озеро Рица, дача Сталина, Голубое озеро, водопад Девичьи слезы, Новый Афон, Цандрипшский каньон. Забронировать экскурсию!"

      let contents_name = Some "Экскурсии по Абхазии и горам"

      let urls = Page.p_tours

      let doc () = Tpl.tpl_base ~position:Tpl.Position.Main ~title ~description ~left center
    end)
