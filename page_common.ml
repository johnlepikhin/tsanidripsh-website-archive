let url ?(shrink_index=false) t =
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

let p_main = Purl.make Path.root "index"

let p_gallery = Purl.make Path.root "фотографии-цандрипш-частный-сектор"

let p_prices = Purl.make Path.root "цены-цандрипш-частный-сектор"

let p_billing = Purl.make Path.root "бронирование"

let p_tours = Purl.make Path.root "туры-по-абхазии"

let p_rooms = Purl.make Path.root "комнаты-цандрипш-частный-сектор"

let p_rooms_tour = Purl.make Path.root "3d-комнаты-цандрипш-частный-сектор"

let p_contacts = Purl.make Path.root "звонки"

let p_feedbacks = Purl.make Path.root "отзывы-цандрипш-частный-сектор"

let p_questions = Purl.make Path.root "вопросы-цандрипш-частный-сектор"

let p_information = Purl.make Path.root "информация"

let p_blog = Purl.make Path.root "блог"

let p_gallery_all = Purl.make Path.root "все-фотографии-цандрипш-частный-сектор"

let p_old_testimonials = Purl.make Path.root "testimonials"

let p_tours_afon = Purl.make Path.tours "тур-в-новый-афон-абхазия"
let p_tours_canyon = Purl.make Path.tours "тур-цандрипшский-каньон"
let p_tours_riza = Purl.make Path.tours "тур-на-озеро-рица-абхазия"
let p_tours_alps = Purl.make Path.tours "тур-на-альпийские-луга-абхазия"

let p_old_tours_afon = Purl.make Path.tours "afon"

let a_tsandripsh = Purl.make Path.articles "поселок-цандрипш"
let a_tsandripsh_temple = Purl.make Path.articles "цандрипшский-храм"
let a_tsandripsh_beach_3d = Purl.make Path.articles "3d-пляж-цандрипша"
let a_climate = Purl.make Path.articles "климат-цандрипша"
let a_webcams = Purl.make Path.articles "вебкамеры-абхазии"

let p_new_year = Purl.make Path.root "новый-год-в-абхазии"
