
module Html5 = Html5.M

let left = <<
	<aside class="main">
	</aside>
>>

let center = <<
	hello
>>

include Page.Make (struct
	let path = Page.p_tours

	let doc = Tpl.tpl_base ~position:Tpl.Position.Tours ~title:"Экскурсии и туры" ~left center
end)
