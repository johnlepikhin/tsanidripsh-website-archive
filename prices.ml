
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
let sauna = 1000

let wifi_per_room = 0

type live = {
    name : string;
    per_person : bool;
    persons : int list;
    prices : int list;
    booking_price : int option;
  }

let live_make ?(per_person=true) ?booking_price name persons prices =
  { name; per_person; booking_price; persons; prices }

let live = [
    live_make "Эконом" [2] [ 300; 300; 300; 300; 300; 350; 400; 400; 350; 300; 250; 250; ];
    live_make "Эконом" [3;4] [ 300; 300; 300; 300; 300; 300; 350; 350; 300; 250; 200; 200; ];
    live_make "Стандарт" [2] [ 300; 300; 300; 300; 300; 450; 450; 500; 450; 350; 350; 350; ];
    live_make "Стандарт" [3;4] [ 300; 300; 300; 300; 300; 350; 400; 400; 350; 250; 250; 250; ];
    live_make ~per_person:false ~booking_price:4000 "Коттедж" [6] [ 2000; 2000; 2000; 2000; 2000; 2000; 2500; 2500; 2000; 2000; 2000; ];
]

let live_discount = 0

let meals3 = 650
let meals2 = 500

let live_min =
  List.fold_left (fun prev elt ->
      let tmin = List.fold_left (fun prev n -> min prev n) max_int elt.prices in
      min tmin prev
    ) max_int live
