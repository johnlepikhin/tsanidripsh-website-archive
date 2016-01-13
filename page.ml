include Page_common

type path = Purl.t

type t = {
	path : path;
	doc : unit -> Html5.M.doc;
	title : string;
	contents_name : string option;
}

let pages = ref []

module type PAGE =
	sig
		val title : string

		val contents_name : string option

		val path : path

		val doc : unit -> Html5.M.doc
	end

let register p =
	try
		let _ = List.find (fun np -> p.path = np.path) !pages in
		raise (failwith ("Page with path '" ^ (url p.path) ^ "' already registered"))
	with
		| Not_found ->
			pages := p :: !pages

let anonymous ?contents_name path doc title =
	let p = { path; doc; title; contents_name } in
	register p;
	p

module Make (P : PAGE) =
	struct
		include P

		let page = { path; doc; title = P.title; contents_name }

		let url = url path

		let () =
			register page
	end

