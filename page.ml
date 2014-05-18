include Page_common

type t = {
	path : Path.t * string;
	doc : Html5.M.doc;
}

let pages = ref []

module type PAGE =
	sig
		val path : Path.t * string

		val doc : Html5.M.doc
	end

let register p =
	try
		let _ = List.find (fun np -> p.path = np.path) !pages in
		raise (failwith ("Page with path '" ^ (url p.path) ^ "' already registered"))
	with
		| Not_found ->
			pages := p :: !pages

let anonymous path doc =
	let p = { path; doc } in
	register p;
	p

module Make (P : PAGE) =
	struct
		include P

		let page = { path; doc }

		let url = url path

		let () =
			register page
	end

