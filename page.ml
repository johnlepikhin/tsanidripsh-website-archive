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

module Make (P : PAGE) =
	struct
		include P

		let page = { path; doc }

		let url = url path

		let () =
			try
				let _ = List.find (fun p -> p.path = path) !pages in
				raise (failwith ("Page with path '" ^ url ^ "' already registered"))
			with
				| Not_found ->
					pages := page :: !pages
	end

