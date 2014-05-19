
module Html5 = Html5.M

let text_img ?right ?(text="") tag img =
	let t = Html5.img ~src:(Purl.to_string img.Gallery.dest_512) ~alt:"" () in
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
	let t = Html5.img ~src:(Purl.to_string img.Gallery.dest_256) ~alt:"" () in
	let js = Gallery_static.gen_jscall_of_tag ~start:img tag in
	let c = "coltitle_img zoomable" in
	<<
		<div class=$str:c$ onclick=$js$>
			$t$
		</div>
	>>
