
module Html = Tyxml.Html

let alt_of_tags tags =
	let titles = List.map Gallery.to_title tags in
	String.concat ", " titles

let alt_of_content ?(text="") content =
	let open Gallery_static in
	match content with
		| Tag (_, tag) -> Printf.sprintf "%s (%s)" text (alt_of_tags [tag])
		| One (_, title) -> Printf.sprintf "%s (%s)" text title

let img_of_content content =
	let open Gallery_static in
	match content with
		| Tag (img, _)
		| One (img, _) -> img

let text_img ?right ?(text="") content =
	let alt = alt_of_content ~text content in
	let img = img_of_content content in
	let t = Html.img ~src:(Purl.to_string img.Gallery.dest_512) ~alt () in
	let js = Gallery_static.jscall_of_content content in
	let c_add = match right with | Some true -> " text_img_right" | Some false | None -> "" in
	let c = "text_img zoomable" ^ c_add in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
			$str:text$
		</div>
	>>

let coltitle_img content =
	let alt = alt_of_content content in
	let img = img_of_content content in
	let t = Html.img ~src:(Purl.to_string img.Gallery.dest_256) ~alt () in
	let js = Gallery_static.jscall_of_content content in
	let c = "coltitle_img zoomable" in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
		</div>
	>>

let textbig_img content =
	let alt = alt_of_content content in
	let img = img_of_content content in
	let t = Html.img ~src:(Purl.to_string img.Gallery.dest_1024) ~alt () in
	let js = Gallery_static.jscall_of_content content in
	let c = "textbig_img" in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
		</div>
	>>
