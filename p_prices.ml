
module Html5 = Html5.M

let left = <<
	<aside class="main">
	</aside>
>>

let center = <<
	hello
>>

include Page.Make (struct
	let path = Page.p_prices

	let doc = Tpl.tpl_base ~position:Tpl.Position.Prices ~title:"Цены и услуги" ~left center
end)
