module Html = Tyxml.Html

let hint = <<
	<b>Это 3D панорама. Вы можете оглянуться, потянув фотографию мышкой. Если вы смотрите наш сайт с телефона, попробуйте потянуть фотографию пальцем или направить телефон в другую сторону.</b>
>>

let pano360 ?(width="100%") ?(height="300px") file =
	let filepath = Static.url file in
	let hash = Cryptokit.(hash_string (Hash.sha1 ()) filepath |> transform_string (Hexa.encode ())) in
	let id = "pano360_" ^ hash in
	Html.Unsafe.data (Printf.sprintf "
<script src=\"/vrview/build/vrview.min.js\"></script>

<script>
	window.addEventListener('load', onVrViewLoad);
	function onVrViewLoad() { var vrView = new VRView.Player('#%s', { image: '%s', width: '%s', height: '%s' }); };
</script>

<script>
</script>

<div style='width=100%%' id=\"%s\"></div>
" id filepath width height id)

let text_pano360 ?right ?(text="") file =
	let c_add = match right with | Some true -> " text_img_right" | Some false | None -> "" in
	let c = "text_img zoomable" ^ c_add in
	<<
		<div class=$str:c$>
			$pano360 file$
			$str:text$
		</div>
	>>

