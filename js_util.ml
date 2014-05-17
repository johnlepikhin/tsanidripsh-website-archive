
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


