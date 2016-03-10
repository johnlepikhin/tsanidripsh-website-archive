
open Prices

type agreagated = {
	month_start : int;
	month_end : int;
	price : int;
}

let discount = 50

let agregated_live =
	let map (name, sizes, prices) =
		let rec loop cur_month prev (lst : int list) =
			match lst with
				| [] -> (
					match prev with
						| None -> []
						| Some (month_start, prev_price) ->
							{ month_start; month_end = cur_month-1; price = prev_price - discount; } :: []
				)
				| price :: tl ->
					match prev with
						| None -> loop (cur_month+1) (Some (cur_month, price)) tl
						| Some (month_start, prev_price) ->
							if prev_price = price then
								loop (cur_month+1) prev tl
							else
								{ month_start; month_end = cur_month-1; price = prev_price - discount; } :: loop (cur_month+1) (Some (cur_month, price)) tl
		in
		let prices = loop 1 None prices in
		name, sizes, prices
	in
	List.map map live
