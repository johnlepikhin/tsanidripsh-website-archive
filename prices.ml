
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
	"Эконом",   [2;3;4],					[ 250;	250;	250;	250;	300;	350;	350;	400;	350;	300;	250;	250; ];

	"Стандарт", [2;3;4],					[ 300;	300;	300;	300;	350;	350;	400;	450;	400;	300;	300;	300; ];
	"Стандарт с питанием", [2;3;4],	[ 800;	800;	800;	800;	850;	850;	900;	950;	900;	850;	800;	800; ];
]

let breakfast = 230
let dinner = 270

let live_min =
	List.fold_left (fun prev (_, _, lst) ->
		let tmin = List.fold_left (fun prev n -> min prev n) max_int lst in
		min tmin prev
	) max_int live
