
open Article
module Html = Tyxml.Html

let webcam_tpl title src =
	[%html
		"<div class='webcam'>
		 <h3>"[Html.pcdata title]"</h3>"
        [src]
	    "</div>"
	]

let webcams = make ~urls:Page_common.a_webcams ~title:"Вебкамеры Абхазии (онлайн)" [%html
	"<div class='tpl_main_center'>"[]"</div>"
	]

