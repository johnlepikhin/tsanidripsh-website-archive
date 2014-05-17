
module Coerce = struct
	exception CantCoerce

	let ecoerce el f =
		let d = f el in
		match Js.Opt.to_option d with
			| None -> raise CantCoerce
			| Some d -> d

	let coerce el f =
		let d = f el in
		match Js.Opt.to_option d with
			| None -> Lwt.fail CantCoerce
			| Some d -> Lwt.return d
end

type 'a t = {
	id : string;
	mutable el : 'a option;
}

exception NotFound of string

let get name coerce =
	let e = Dom_html.document##getElementById (Js.string name) in
	match Js.Opt.to_option e with
		| None -> Lwt.fail (NotFound name)
		| Some e -> Coerce.coerce e coerce

let init id coerce =
	let v = {
		id = id;
		el = None;
	} in
	fun () -> match v.el with
		| None ->
			lwt nv = get v.id coerce in
			v.el <- Some nv;
			Lwt.return nv
		| Some e -> Lwt.return e

let string_of_field f =
	lwt f = f () in
	let r = Js.to_string (f##value) in
	Lwt.return r

let div id = init id Dom_html.CoerceTo.div

