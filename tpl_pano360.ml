module Html = Tyxml.Html

let hint = [%html{|
<b>Это 3D панорама. Вы можете оглянуться, потянув фотографию мышкой. Если вы смотрите наш сайт с телефона, попробуйте потянуть фотографию пальцем или направить телефон в другую сторону.</b>
|}]

let pano360 ?(width="100%") ?(height="300px") ?(title="") file =
  let filepath = Static.url file in
  let hash = Cryptokit.(hash_string (Hash.sha1 ()) filepath |> transform_string (Hexa.encode ())) in
  let id = "pano360_" ^ hash in
  Html.Unsafe.data (Printf.sprintf "
<script async src='/vrview/build/vrview.min.js'></script>

<script>
      function vr360ViewLoad(id, image) {
        document.getElementById(id).innerHTML = '';
        vrView = new VRView.Player('#' + id, {
          image: image,
          width: '%s', height: '%s'
        });
      }
</script>

<h2>%s</h2>

<div onclick=\"vr360ViewLoad('%s', '%s')\" id='%s' style='width: 100%%'>
    <img src=\"/vrview/vr360.png\" alt=\"Кликните, чтобы оглянуться\">
</div>
" width height title id filepath id)

let text_pano360 ?right ?(text="") file =
  let c_add = match right with | Some true -> " text_img_right" | Some false | None -> "" in
  let c = ["text_img"; "zoomable" ^ c_add] in
  let content = [pano360 file; Html.pcdata ("3D-панорама. " ^ text)] in
  [%html"<div class="c">"content"</div>"]
