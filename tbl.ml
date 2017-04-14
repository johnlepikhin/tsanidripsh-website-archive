
module Html = Tyxml.Html

let simple ?(className="") ?head (rows : [< Html_types.tr_content ] Html.elt list list) =
	let head = match head with
		| None -> []
		| Some lst ->
			List.map (fun v -> << <th>$str:v$</th> >> ) lst
	in
	let rows = List.map (fun cells -> << <tr>$list:cells$</tr> >>) rows in
	<<
		<table class=$str:className$>
			<tr>$list:head$</tr>
			$list:rows$
		</table>
	>>
	
