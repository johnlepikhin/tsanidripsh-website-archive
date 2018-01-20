module Html = Tyxml.Html

let to_string = function
	| 0 ->
		let rel = Config.prices_relevance in
		[%html "<u class='prices' title="rel">бесплатно</u>" ]
	| p ->
		let rel = Config.prices_relevance in
		let price = Printf.sprintf "%i руб." p in
		[%html "<u class='prices' title="rel">"[Html.pcdata price]"</u>" ]

