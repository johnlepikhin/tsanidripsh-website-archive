
open Js_util

let page_header_move =
	let img_width = 3000 in
	let img_height = 400 in
	let bgPosX = ref (-img_width/2) in
	let bgPosY = ref (-img_height/2) in
	fun div maxmove time ->
		let div_width = div##.offsetWidth in
		let div_height = div##.offsetHeight in

		let genpos img_len div_len pos =
			let min_possible = -(img_len-div_len) in
			let max_possible = 0 in
			let min_generated = max min_possible (!pos - maxmove) in
			let max_generated = min max_possible (!pos + maxmove) in
			let diff = max_generated - min_generated in
			let rnd = Random.int diff in
			let newpos = min_generated + rnd in
			pos := newpos;
			newpos
		in
		let newx = genpos img_width div_width bgPosX in
		let newy = genpos img_height div_height bgPosY in

		let pos = Printf.sprintf "%ipx %ipx" newx newy in

		Js.Unsafe.set (div##.style) (Js.string "transition") (Js.string (Printf.sprintf "background-position %fs" time));
		div##.style##.backgroundPosition := Js.string pos

let page_header_move_handler div _ =
	page_header_move div 900 0.5;
	Lwt.return ()

let rec page_header_move_periodic div =
	let%lwt () = Lwt_js.sleep 8. in
	page_header_move div 600 3.;
	page_header_move_periodic div

let init_page_header () =
	let div = Dom_html.of_id ~coerce:Dom_html.CoerceTo.div Id.tpl_main_header in
	match div with
		| None -> ()
		| Some div ->
			ignore (page_header_move_periodic div);
			div##.onclick := handler (page_header_move_handler div) Js._true

let init_mobile () =
	if Js_util.is_mobile () then
		(!Js_util.body)##.className := (Js.string "tpl_main mobile")
	else
		(!Js_util.body)##.className := (Js.string "tpl_main")

let init () =
	init_mobile ();
	Js_util.(resizeEvents := init_mobile :: !resizeEvents);
	if not (Js_util.is_mobile ()) then
		init_page_header ()
