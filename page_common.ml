let string_of_purl ?(shrink_index=false) (t : Purl.t) =
  let open Purl in
  if t.path = [] then
    if t.file = "index" && shrink_index then
      "/"
    else
      Printf.sprintf "/%s.html" t.file
  else
    let p = Path.to_string t.path in
    if t.file = "index" && shrink_index then
      p
	else
	  Printf.sprintf "%s/%s.html" p t.file

let url ?(shrink_index=false) (t : PageURLs.t) =
  string_of_purl ~shrink_index t.PageURLs.current

let historic_urls ?(shrink_index=false) (t : PageURLs.t) =
  List.map (string_of_purl ~shrink_index) t.PageURLs.historic
  
let p_main =
  Purl.make Path.root "index"
  |> PageURLs.make

let p_404 =
  Purl.make Path.root "404"
  |> PageURLs.make

let p_gallery =
  Purl.make Path.root "photos"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "фотографии-цандрипш-частный-сектор"
       ]

let p_prices =
  Purl.make Path.root "prices"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "цены-цандрипш-частный-сектор"
       ]

let p_billing =
  Purl.make Path.root "booking"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "бронирование"
       ]

let p_tours =
  Purl.make Path.root "tours"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "туры-по-абхазии"
       ]

let p_rooms =
  Purl.make Path.root "accomodation"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "комнаты-цандрипш-частный-сектор";
         Purl.make Path.root "rooms"
       ]

let p_rooms_tour =
  Purl.make Path.root "rooms_tour"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "3d-комнаты-цандрипш-частный-сектор"
       ]

let p_contacts =
  Purl.make Path.root "calls"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "звонки"
       ]

let p_feedbacks =
  Purl.make Path.root "feedback"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "отзывы-цандрипш-частный-сектор";
         Purl.make Path.root "testimonials";
       ]

let p_questions =
  Purl.make Path.root "questions"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "вопросы-цандрипш-частный-сектор"
       ]

let p_information =
  Purl.make Path.root "faq"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "информация"
       ]

let p_blog =
  Purl.make Path.root "blog"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "блог"
       ]

let p_gallery_all =
  Purl.make Path.root "all-photos"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "все-фотографии-цандрипш-частный-сектор"
       ]

let p_tours_afon =
  Purl.make Path.tours "novij_afon"
  |> PageURLs.make ~historic:[
         Purl.make Path.tours "тур-в-новый-афон-абхазия";
         Purl.make Path.tours "new_afon"
       ]
  
let p_tours_canyon =
  Purl.make Path.tours "tsandripsh_canyon"
  |> PageURLs.make ~historic:[
         Purl.make Path.tours "тур-цандрипшский-каньон"
       ]

let p_tours_riza =
  Purl.make Path.tours "riza"
  |> PageURLs.make ~historic:[
         Purl.make Path.tours "тур-на-озеро-рица-абхазия"
       ]

let p_tours_alps =
  Purl.make Path.tours "alpine_grasslands"
  |> PageURLs.make ~historic:[
         Purl.make Path.tours "тур-на-альпийские-луга-абхазия"
       ]

let a_tsandripsh =
  Purl.make Path.articles "tsandripsh"
  |> PageURLs.make ~historic:[
         Purl.make Path.articles "поселок-цандрипш"
       ]
  
let a_tsandripsh_temple =
  Purl.make Path.articles "tsandripsh-temple"
  |> PageURLs.make ~historic:[
         Purl.make Path.articles "цандрипшский-храм"
       ]

let a_tsandripsh_beach_3d =
  Purl.make Path.articles "3d-tsandripsh-beach"
  |> PageURLs.make ~historic:[
         Purl.make Path.articles "3d-пляж-цандрипша"
       ]

let a_climate =
  Purl.make Path.articles "climate"
  |> PageURLs.make ~historic:[
         Purl.make Path.articles "климат-цандрипша"
       ]

let a_webcams =
  Purl.make Path.articles "webcams"
  |> PageURLs.make ~historic:[
         Purl.make Path.articles "вебкамеры-абхазии"
       ]

let p_new_year =
  Purl.make Path.root "new-year"
  |> PageURLs.make ~historic:[
         Purl.make Path.root "новый-год-в-абхазии";
         Purl.make Path.root "new-year-2013";
       ]
