module Html = Tyxml.Html

let pano360 file =
	let filepath = Static.url_full file in
	let hash = Cryptokit.(hash_string (Hash.sha1 ()) filepath |> transform_string (Hexa.encode ())) in
	let id = "pano360_" ^ hash in
	Html.Unsafe.data (Printf.sprintf "
<script src=\"http://storage.googleapis.com/vrview/2.0/build/vrview.min.js\"></script>

<script>
	window.addEventListener('load', onVrViewLoad);
	function onVrViewLoad() { var vrView = new VRView.Player('#%s', { image: '%s' }); };
</script>

<script>
</script>

<div id=\"%s\"></div>
" id filepath id)


