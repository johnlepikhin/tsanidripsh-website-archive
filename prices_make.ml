
open Prices

type agregated = {
    month_start : int;
    month_end : int;
    price : int;
  }

type t = {
    name : string;
    per_person : bool;
    booking_price : int option;
    persons : int list;
    prices : agregated list;
  }
                
let agregated_live =
  let map (elt : Prices.live) =
    let rec loop cur_month prev (lst : int list) =
      match lst with
      | [] -> (
        match prev with
        | None -> []
        | Some (month_start, prev_price) ->
           { month_start; month_end = cur_month-1; price = prev_price - live_discount; } :: []
      )
      | price :: tl ->
         match prev with
         | None -> loop (cur_month+1) (Some (cur_month, price)) tl
         | Some (month_start, prev_price) ->
            if prev_price = price then
              loop (cur_month+1) prev tl
            else
              { month_start; month_end = cur_month-1; price = prev_price - live_discount; }
              :: loop (cur_month+1) (Some (cur_month, price)) tl
    in
    let prices = loop 1 None elt.Prices.prices in
    { name = elt.name; per_person = elt.Prices.per_person; persons = elt.Prices.persons; booking_price = elt.Prices.booking_price; prices }
  in
  List.map map live
