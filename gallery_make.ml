
module Html5 = Html5.M

module Tag =
	struct
		type tag =
			| Condition
			| Sea
			| Village
			| Tour
	end

include Tag

type t = {
	file : string;
	ext : string;
	tags : tag list;
	description : Html5_types.flow5 Html5.elt;
	dest_64 : Purl.t;
	dest_256 : Purl.t;
	dest_512 : Purl.t;
	dest_1024 : Purl.t;
	dest : Purl.t;
}

let items : t list ref = ref []

let make_url path file ext size =
	let file = Printf.sprintf "%s__%i.%s" file size ext in
	Purl.make path file

let make file ext tags description =
	let make_url = make_url Path.gallery file ext in
	let dest_64 = make_url 64 in
	let dest_256 = make_url 256 in
	let dest_512 = make_url 512 in
	let dest_1024 = make_url 1024 in
	let dest = Purl.make Path.gallery (Printf.sprintf "%s.%s" file ext) in
	let t = { file; ext; tags; description; dest_64; dest_256; dest_512; dest_1024; dest; } in
	items := t :: !items;
	t


