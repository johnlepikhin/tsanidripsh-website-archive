
open Article
module Html = Tyxml.Html

let tsandripsh = make ~path:Page_common.a_tsandripsh_beach_3d ~title:"3D: пляж Цандрипша" <<
	<div class="tpl_main_center">
		$Tpl_pano360.pano360 ~title:"По пути к пляжу" Static.pano_tsandripsh_beach1$
		$Tpl_pano360.hint$
		$Tpl_pano360.pano360 ~title:"Основной пляж (от нашего дома 7-10 минут)" Static.pano_tsandripsh_beach2$
		$Tpl_pano360.hint$
		$Tpl_pano360.pano360 ~title:"Пляж 'Белые скалы' (от нашего дома 25 минут)" Static.pano_tsandripsh_beach3$
		$Tpl_pano360.hint$
	</div>
>>


