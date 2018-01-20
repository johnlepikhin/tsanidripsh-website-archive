
module Html = Tyxml.Html

let simple ?(className="") ?head (rows : [< Html_types.tr_content ] Html.elt list list) =
	let head = match head with
		| None -> []
		| Some lst ->
			List.map (fun v -> Html.th [v] ) lst
	in
	let rows = List.map (fun cells -> Html.tr cells) rows in
	Html.table ~a:[Html.a_class [className]] ~thead:(Html.thead [Html.tr head]) rows
