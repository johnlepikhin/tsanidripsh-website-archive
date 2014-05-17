
open Js_util

module G = Gallery

let root = ref (Dom_html.createDiv Dom_html.document)

let max_width = ref 512.

let init_root () =
	lwt newroot = (Js_eid.init Common_config.div_center_gallery Dom_html.CoerceTo.div) () in
	root := newroot;
	max_width := float_of_int ((!root)##offsetWidth - 100);
	Lwt.return newroot

let list = ref []

let is_active = ref false

module View =
	struct
		let close div _ =
			is_active := false;
			div##style##opacity <- Js.def (Js.string "0");
			div##style##width <- Js.string "0px";
			div##style##height <- Js.string "0px";
			div##style##marginLeft <- Js.string "0px";
			div##style##marginTop <- Js.string "0px";

			ignore (lwt () = Lwt_js.sleep 0.3 in Dom.removeElement div; Lwt.return ());
			Lwt.return ()

		let preload_image id =
			let p = List.nth !list id in
			let img = Dom_html.createImg Dom_html.document in
			let string_url = Purl.to_string p.Gallery.dest_1024 in
			img##src <- Js.string string_url;
			p, img

		let rec add_image div height id =
			Dom.removeChilds div;

			let (p, img) = preload_image id in
			img##className <- Js.string "gallery_view";
			img##height <- height;
			Dom.appendChild div img;
			img##style##opacity <- Js.def (Js.string "0");
			Js.Unsafe.set (img##style) (Js.string "transition") (Js.string "opacity 0.3s");
			lwt () = Lwt_js.sleep 0.05 in
			img##style##opacity <- Js.def (Js.string "1");

			let img_width = img##clientWidth in
			let div_width = div##clientWidth in

			(* neighbours *)
			if id + 1 < List.length !list then
			begin
				let id_next = id + 1 in
				ignore (preload_image id_next);
				let div_next = Dom_html.createDiv Dom_html.document in
				div_next##className <- Js.string "gallery_view_next";
				div_next##style##height <- Js.string ((string_of_int height) ^ "px");
				div_next##style##marginLeft <- Js.string ((string_of_int (img_width-100+5)) ^ "px");
				div_next##style##lineHeight <- Js.string ((string_of_int (height)) ^ "px");
				div_next##innerHTML <- Js.string "→";

				div_next##onclick <- handler (fun _ -> add_image div height id_next) Js._false;

				img##style##opacity <- Js.def (Js.string "1");
				Js.Unsafe.set (div_next##style) (Js.string "transition") (Js.string "opacity 0.3s");
				Dom.appendChild div div_next;
			end;

			if id > 0 then
			begin
				let id_prev = id - 1 in
				ignore (preload_image id_prev);
				let div_prev = Dom_html.createDiv Dom_html.document in
				div_prev##className <- Js.string "gallery_view_prev";
				div_prev##style##height <- Js.string ((string_of_int height) ^ "px");
				div_prev##style##lineHeight <- Js.string ((string_of_int (height)) ^ "px");
				div_prev##onclick <- handler (fun _ -> add_image div height id_prev) Js._false;
				div_prev##innerHTML <- Js.string "←";

				img##style##opacity <- Js.def (Js.string "1");
				Js.Unsafe.set (div_prev##style) (Js.string "transition") (Js.string "opacity 0.3s");
				Dom.appendChild div div_prev;
			end;

			let close_height = 50 in

			let right_width = Js.string ((string_of_int (div_width - img_width - 15)) ^ "px") in

			(* description *)
			let div_descr = Dom_html.createDiv Dom_html.document in
			div_descr##className <- Js.string "gallery_view_description";
			div_descr##style##marginLeft <- Js.string ((string_of_int (img_width+10)) ^ "px");
			div_descr##style##height <- Js.string ((string_of_int (height-5-close_height-5)) ^ "px");
			div_descr##style##width <- right_width;
			div_descr##innerHTML <- Js.string (Html_print.elt_to_string p.G.description);
			Dom.appendChild div div_descr;

			(* close *)
			let div_close = Dom_html.createDiv Dom_html.document in
			div_close##className <- Js.string "gallery_view_close";
			div_close##style##marginLeft <- Js.string ((string_of_int (img_width+10)) ^ "px");
			div_close##style##marginTop <- Js.string ((string_of_int (height-close_height)) ^ "px");
			div_close##style##height <- Js.string ((string_of_int close_height) ^ "px");
			div_close##style##width <- right_width;
			div_close##innerHTML <- Js.string "Закрыть";
			div_close##onclick <- handler (close div) Js._true;
			Dom.appendChild div div_close;

			Lwt.return ()

		let view id =
			is_active := true;
			let d = Dom_html.document##documentElement in
			let width = (d##clientWidth) - 100 in
			let height = (d##clientHeight) - 60 in

			let height =
				if ((float_of_int width) /. (float_of_int height)) < 1.6 then
					int_of_float ((float_of_int height) /. 1.3)
				else
					height
			in

			let div = Dom_html.createDiv Dom_html.document in
			div##className <- Js.string "gallery_view_main";
			div##style##opacity <- Js.def (Js.string "0");
			div##style##width <- Js.string "0px";
			div##style##height <- Js.string "0px";
			div##style##marginLeft <- Js.string "0px";
			div##style##marginTop <- Js.string "0px";
			Dom.appendChild !root div;
			Js.Unsafe.set (div##style)
				(Js.string "transition")
				(Js.string "height 0.3s, width 0.3s, margin-left 0.3s, margin-top 0.3s, opacity 0.3s, box-shadow");
			lwt () = Lwt_js.sleep 0.05 in
			div##style##opacity <- Js.def (Js.string "1");
			div##style##width <- Js.string ((string_of_int width) ^ "px");
			div##style##height <- Js.string ((string_of_int height) ^ "px");
			div##style##marginLeft <- Js.string ((string_of_int (-width/2)) ^ "px");
			div##style##marginTop <- Js.string ((string_of_int (-height/2)) ^ "px");
			div##style##marginTop <- Js.string ((string_of_int (-height/2)) ^ "px");

			let (_ : G.t * Dom_html.imageElement Js.t) = preload_image id in
			ignore (lwt () = Lwt_js.sleep 0.3 in add_image div (height-10) id);

			Lwt.return ()
			
	end

let click_processor id _ =
	if not !is_active then
		View.view id
	else
		Lwt.return ()

module GRows =
	struct
		type entry = {
			id : int;
		}

		type row = {
			width : float;
			imgs : entry list;
		}

		type data = {
			last_id : int;
			row : row;
		}

		let empty = {
			width = 0.;
			imgs = [];
		}

		let add_to_row row img width = {
				width = row.width +. width;
				imgs = img :: row.imgs;
		}

		let output_row row =
			let ratio = row.width /. !max_width in
			let is_first = ref true in
			let output_one e =
				let p = List.nth !list e.id in
				let div = Dom_html.createDiv Dom_html.document in
				if !is_first then
					div##className <- Js.string "gallery_preview_element gallery_preview_element_first"
				else	
					div##className <- Js.string "gallery_preview_element";

				let img = Dom_html.createImg Dom_html.document in
				img##onclick <- handler (click_processor e.id) Js._true;
				let string_url_256 = Purl.to_string p.Gallery.dest_256 in
				img##src <- Js.string string_url_256;
				Js.Unsafe.set (img##style) (Js.string "transition") (Js.string "height 0.3s, opacity 0.3s");
				img##height <- 0;
				img##style##opacity <- Js.def (Js.string "0");
				Dom.appendChild div img;
				Dom.appendChild !root div;
				is_first := false;
				lwt () = Lwt_js.sleep 0.05 in
				img##height <- int_of_float (256. /. ratio);
				img##style##opacity <- Js.def (Js.string "1");
				Lwt.return ()

			in
			Lwt_list.iter_s output_one (List.rev row.imgs)

		let add_one_preview data p =
			let string_url_orig = Purl.to_string p.Gallery.dest in
			Firebug.console##log (Js.string string_url_orig);
			let info = Hashtbl.find Gallery_info.info string_url_orig in
			let height = 256. in

			let orig_width = float_of_int info.Gallery_info.width in
			let orig_height = float_of_int info.Gallery_info.height in

			let ratio = orig_width /. orig_height in

			let width = height *. ratio in

			let id = data.last_id + 1 in

			let entry = { id } in
			let row = add_to_row data.row entry width in

			if row.width > !max_width then
				lwt () = output_row row in
				Lwt.return { row = empty; last_id = id }
			else
				Lwt.return { row; last_id = id }

		let draw () =
			Dom.removeChilds !root;
			let data = { last_id = -1; row = empty } in
			lwt data = Lwt_list.fold_left_s add_one_preview data !list in
			if data.row.width > 0. then
				output_row data.row
			else
				Lwt.return ()
	end

let init () =
	lwt root = init_root () in
	let l = List.rev !Gallery.items in
	list := l;
	GRows.draw ()
