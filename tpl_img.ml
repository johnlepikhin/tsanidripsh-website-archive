
module Html5 = Html5.M

let alt_of_tags tags =
	let titles = List.map Gallery.to_title tags in
	String.concat ", " titles


let text_img ?right ?(text="") tag img =
	let alt = Printf.sprintf "%s (%s)" text (alt_of_tags [tag]) in
	let t = Html5.img ~src:(Purl.to_string img.Gallery.dest_512) ~alt () in
	let js = Gallery_static.gen_jscall_of_tag ~start:img tag in
	let c_add = match right with | Some true -> " text_img_right" | Some false | None -> "" in
	let c = "text_img zoomable" ^ c_add in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
			$str:text$
		</div>
	>>

let coltitle_img tag img =
	let t = Html5.img ~src:(Purl.to_string img.Gallery.dest_256) ~alt:(alt_of_tags [tag]) () in
	let js = Gallery_static.gen_jscall_of_tag ~start:img tag in
	let c = "coltitle_img zoomable" in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
		</div>
	>>

let textbig_img tag img =
	let t = Html5.img ~src:(Purl.to_string img.Gallery.dest_1024) ~alt:(alt_of_tags [tag]) () in
	let js = Gallery_static.gen_jscall_of_tag ~start:img tag in
	let c = "textbig_img" in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
		</div>
	>>
