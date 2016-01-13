
module Dom =
	struct
		include Dom

		let removeChilds p =
			let rec loop () =
				let c = p##firstChild in
					match Js.Opt.to_option c with
						| None -> ()
						| Some c -> removeChild p c; loop ()
				in
				loop ()


		let removeElement el =
			let p = el##parentNode in
			match Js.Opt.to_option p with
				| None -> ()
				| Some p -> Dom.removeChild p el
	end

module Dom_html =
	struct
		include Dom_html

		let of_id ~coerce id =
			let s = Id.to_string id in
			let r = document##getElementById (Js.string s) in
			match Js.Opt.to_option r with
				| None -> None
				| Some r ->
					let r = coerce r in
					Js.Opt.to_option r
	end

let alert s =
	let s = Js.string s in
	Dom_html.window##alert (s)

let wrap_error f arg =
	try_lwt
		f arg
	with
		| Exit -> Lwt.fail Exit
		| e ->
			Lwt.return ()

let eignore f arg =
        ignore (wrap_error f arg)

let handler f r = Dom_html.handler (fun v -> eignore f v; r)

(* body *)

let body = ref (Dom_html.createBody Dom_html.document)

let init_body () =
	match Dom_html.of_id ~coerce:Dom_html.CoerceTo.body Id.body with
		| None -> ()
		| Some el ->
			body := el

(* mobile *)

let getWindowWidth () =
	match Dom_html.window##innerWidth |> Js.Optdef.to_option with
		| None -> 500
		| Some v -> v

let is_mobile () =
	let rex = Regexp.regexp "Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile" in
	match Regexp.string_match rex (Js.to_string Dom_html.window##navigator##userAgent) 0 with
		| None ->
			getWindowWidth () < 960
		| Some _ -> true

(* resize *)

let resizeEvents = ref []

let onResize =
	let timeout_id = ref None in
	let window = Dom_html.window in
	fun _ ->
		let () =
			match !timeout_id with
				| None -> ()
				| Some id -> window##clearTimeout (id)
		in
		let id = window##setTimeout
			((Js.wrap_callback (fun () ->
				List.iter (fun e -> e ()) !resizeEvents)
			),
			300.)
		in
		timeout_id := Some id;
		Js._true

let () =
	let window = Dom_html.window in
	ignore (window##onresize <- Dom.handler onResize);
	ignore (window##onorientationchange <- Dom.handler onResize);
