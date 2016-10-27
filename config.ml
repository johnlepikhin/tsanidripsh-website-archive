
let is_new_year = true

let static_path = "/home/eugene/projects/auto_tsandripsh_hotel/static"

let gallery_src_path = "/home/eugene/projects/auto_tsandripsh_hotel/gallery"

let install_path = ref "/tmp/tsandripsh"

let year = "2017"

let season = "Осень-зима 2016"

let main_title =
	let title =
		if is_new_year then
			"Новый год в Абхазии, Цандрипш, частный сектор"
		else
			"Отдых в Абхазии, Цандрипш, частный сектор"
	in
	title ^ ". " ^ season

let keywords = Printf.sprintf "Цандрипш, частный сектор, без посредников, отдых, Абхазия, %s" year

let description = Printf.sprintf "Поселок Цандрипш, частный сектор. Отдых Абхазии. %s." year

let phones = [
	"+7(928)447-56-81", "Минас", "Мегафон";
	"+7(918)403-04-27", "Алина", "МТС";
]

let mailto = "minas777abkhazia@mail.ru"

let site_domain = "tsandripsh-hotel.ru"

let copyright = "Evgenii Lepikhin // johnlepikhin@gmail.com"
