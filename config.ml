
let is_new_year = false

let static_path = "/home/eugene/programming/tsandripsh/static"

let gallery_src_path = "/home/eugene/programming/tsandripsh/gallery"

let install_path = ref "/tmp/tsandripsh"

let year = "2015"

let season = "Лето 2015"

let main_title =
	let title =
		if is_new_year then
			"Новый год в Абхазии"
		else
			"Отдых в Абхазии"
	in
	title ^ " " ^ season

let keywords = Printf.sprintf "Цандрипш, частный сектор, без посредников, отдых, Абхазия, %s" year

let description = Printf.sprintf "Поселок Цандрипш, частный сектор. Отдых Абхазии. %s." year

let phones = [
	"+7(928)447-56-81", "Минас", "Мегафон";
	"+7(918)403-04-27", "Алина", "МТС";
]

let mailto = "minas777abkhazia@mail.ru"

let site_domain = "tsandripsh-hotel.ru"

let copyright = "Evgenii Lepikhin // johnlepikhin@gmail.com"
