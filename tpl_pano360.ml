module Html = Tyxml.Html

let pano360 file =
	let filepath = Static.url file in
	let hash = Cryptokit.(hash_string (Hash.sha1 ()) filepath |> transform_string (Hexa.encode ())) in
	let id = "pano360_" ^ hash in
	Html.Unsafe.data (Printf.sprintf "
<script src=\"/vrview/build/vrview.min.js\"></script>

<script>
	window.addEventListener('load', onVrViewLoad);
	function onVrViewLoad() { var vrView = new VRView.Player('#%s', { image: '%s', width: '100%%', height: '300px' }); };
</script>

<script>
</script>

<div style='width=100%%' id=\"%s\"></div>
" id filepath id)
