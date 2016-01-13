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

let p_gallery = Purl.make Path.root "gallery"

let p_prices = Purl.make Path.root "prices"

let p_billing = Purl.make Path.root "billing"

let p_tours = Purl.make Path.root "tours"

let p_rooms = Purl.make Path.root "rooms"

let p_contacts = Purl.make Path.root "contacts"

let p_feedbacks = Purl.make Path.root "feedbacks"

let p_questions = Purl.make Path.root "questions"

let p_information = Purl.make Path.root "information"

let p_gallery_all = Purl.make Path.root "gallery_all"

let p_old_testimonials = Purl.make Path.root "testimonials"

let p_tours_afon = Purl.make Path.tours "tour_noviy_afon"
let p_tours_canyon = Purl.make Path.tours "tour_tsandripsh_canyon"
let p_tours_riza = Purl.make Path.tours "tour_ozero_riza"
let p_tours_alps = Purl.make Path.tours "tour_alps"

let p_old_tours_afon = Purl.make Path.tours "afon"

let a_tsandripsh = Purl.make Path.articles "tsandripsh"
let a_climate = Purl.make Path.articles "climate"

let p_new_year = Purl.make Path.root "new_year"
