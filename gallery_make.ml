
module Html = Tyxml.Html

module Tag =
	struct
		type tag =
			| Condition
			| Sea
			| Tsandripsh
			| Tours
			| Canyon
			| Riza
			| Alps
			| Afon
			| Cave
			| Plant
			| Animal
			| We
			| Winter
			| Spring
			| Summer
			| Autumn
			| Wine

		let to_title = function
			| Condition -> "Условия проживания"
			| Sea -> "Наше море"
			| Tsandripsh -> "Цандрипш — курортный поселок"
			| Tours -> "Туры по Абхазии"
			| Canyon -> "Цандрипшский каньон и самшитовый лес"
			| Riza -> "Озеро Рица"
			| Alps -> "Альпийские луга"
			| Afon -> "Новый Афон, монастырь"
			| Cave -> "Новоафонская пещера"
			| Plant -> "Растения"
			| Animal -> "Животные"
			| We -> "Наша семья"
			| Winter -> "Зима в Абхазии"
			| Spring -> "Весна в Абхазии"
			| Summer -> "Лето в Абхазии"
			| Autumn -> "Осень в Абхазии"
			| Wine -> "Вина Абхазии"


		let all = [ Condition; Sea; Tsandripsh; Tours; Canyon; Riza; Alps; Afon; Cave; Plant; Animal; We ]
	end

include Tag

type t = {
	id : int;
	file : string;
	ext : string;
	tags : tag list;
	description : Html_types.flow5 Html.elt;
	dest_64 : Purl.t;
	dest_256 : Purl.t;
	dest_512 : Purl.t;
	dest_1024 : Purl.t;
	dest_2048 : Purl.t;
	dest : Purl.t;
	hidden : bool;
}

let for_install : t list ref = ref []

let items : t list ref = ref []

let make_url path file ext size =
	let file = Printf.sprintf "%s__%i.%s" file size ext in
	Purl.make path file

let make =
	let id = ref 0 in
	fun file ?(hidden=false) ext tags description ->
		let make_url = make_url Path.gallery file ext in
		let dest_64 = make_url 64 in
		let dest_256 = make_url 256 in
		let dest_512 = make_url 512 in
		let dest_1024 = make_url 1024 in
		let dest_2048 = make_url 2048 in
		let dest = Purl.make Path.gallery (Printf.sprintf "%s.%s" file ext) in
		let t = { id = !id; file; ext; tags; description; dest_64; dest_256; dest_512; dest_1024; dest_2048; dest; hidden; } in
		if not hidden then
			items := t :: !items;
		for_install := t :: !for_install;
		incr id;
		t

let t_of_id id = List.find (fun p -> p.id = id) !items

let opt_pos_of_id id list =
	let rec loop pos = function
		| [] -> None
		| hd :: tl ->
			if hd.id = id then
				Some pos
			else
				loop (pos+1) tl
	in
	loop 0 list

let pos_of_id id list =
	match opt_pos_of_id id list with
		| None -> 0
		| Some pos -> pos

let items_of_ids lst =
	let rec loop = function
		| [] -> []
		| hd :: tl ->
			try
				t_of_id hd :: loop tl
			with
				| _ -> loop tl
	in
	loop lst

let filter_by_tag tag =
	let check p = List.mem tag p.tags in
	List.find_all check !items


