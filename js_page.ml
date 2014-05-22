
type t =
	| Gallery
	| Other

let of_uri uri =
	if uri = Page_common.url Page.p_gallery then
		Gallery
	else
		Other

let (domain, page) =
	let url = Js.to_string Dom_html.document##_URL in
	let module R = Regexp in
	let regexp = R.regexp "://([^/]+)(.*)" in
	let r = R.string_match regexp url 0 in
	match r with
		| None -> "", Other
		| Some r ->
			let domain = R.matched_group r 1 in
			let uri = R.matched_group r 2 in
			match domain, uri with
				| None, None -> "", Other
				| None, Some uri -> "", of_uri uri
				| (Some domain), None -> domain, Other
				| (Some domain), (Some uri) -> domain, of_uri uri
