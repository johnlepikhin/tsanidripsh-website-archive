
open Article
module Html = Tyxml.Html

let webcam_tpl title src =
	[%html
		"<div class='webcam'>
			<h3>"[Html.pcdata title]"</h3>
			<iframe src="src">
			</iframe>
			<small>Для просмотра камеры необходим установленный FlashPlayer</small>
		</div>"
	]

let webcam_psou1 = webcam_tpl "Граница с Россией"
	"http://91.231.219.146:8080/psou_1/embed.html?dvr=false&token=2248373974a234c9100c9633810670c22a0f1754-497cb38848096dc9222d1bebaec9649b-1496073949-1496070349"

let webcam_psou2 = webcam_tpl "Вид с КПП на границе с Россией в сторону Псоу"
	"http://91.231.219.146:8080/psou_2/embed.html?dvr=false&token=8bea468d94bc13579cf2954c9ff32ba74404fce2-c0845776dd69459df150a0f319014601-1496073549-1496069949"

let webcams = make ~path:Page_common.a_webcams ~title:"Вебкамеры Абхазии (онлайн)" [%html
	"<div class='tpl_main_center'>"[webcam_psou1; webcam_psou2]"</div>"
	]

