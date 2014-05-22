
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
