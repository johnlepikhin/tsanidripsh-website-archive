
let transfer_from_border = 0
let transfer_to_border = 300
let transfer_aeroport = 1000
let transfer_to_aeroport = 1800
let transfer_railroad = 800

let tour_riza = 600
let tour_cave = 600
let tour_canyon = 600
let tour_canyon2 = 1000
let tour_alps = 1000
let tour_alps_bbq = 1500
let tour_sukhum = 1000
let tour_horses = 600

let wifi_per_room = 0

let live = [
	"Эконом",   [2],						[ 350;	350;	350;	350;	350;	350;	350;	400;	350;	350;	350;	350; ];
	"Эконом",   [3;4],					[ 300;	300;	300;	300;	300;	300;	300;	350;	300;	300;	300;	300; ];

	"Стандарт", [2],						[ 400;	400;	400;	400;	400;	400;	400;	500;	400;	400;	400;	400; ];
	"Стандарт", [3;4],					[ 300;	300;	300;	300;	350;	350;	350;	400;	350;	300;	300;	300; ];
]

let live_discount = 0

let meals3 = 650
let meals2 = 500

let live_min =
	List.fold_left (fun prev (_, _, lst) ->
		let tmin = List.fold_left (fun prev n -> min prev n) max_int lst in
		min tmin prev
	) max_int live
