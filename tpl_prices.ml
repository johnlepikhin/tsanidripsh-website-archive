module Html = Tyxml.Html

let to_string = function
	| 0 -> << <u class="prices" title=$Config.prices_relevance$>бесплатно</u> >>
	| p -> << <u class="prices" title=$Config.prices_relevance$>$str:Printf.sprintf "%i&nbsp;руб." p$</u> >>

