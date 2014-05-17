
open Js_util

module G = Gallery

let root = ref (Dom_html.createDiv Dom_html.document)

let init_root () =
	lwt newroot = (Js_eid.init Common_config.div_center_gallery Dom_html.CoerceTo.div) () in
	root := newroot;
	Lwt.return newroot

let max_width = ref 512.

let list = ref []

let current_title = ref ""

let is_active = ref false

module View =
	struct
		let do_close div =
			is_active := false;
			div##style##opacity <- Js.def (Js.string "0");
			div##style##width <- Js.string "0px";
			div##style##height <- Js.string "0px";
			div##style##marginLeft <- Js.string "0px";
			div##style##marginTop <- Js.string "0px";

			ignore (lwt () = Lwt_js.sleep 0.3 in Dom.removeElement div; Lwt.return ());
			Lwt.return ()

		let close div _ =
			do_close div

		let preload_image id =
			let p = List.nth !list id in
			let img = Dom_html.createImg Dom_html.document in
			let string_url = Purl.to_string p.Gallery.dest_1024 in
			img##src <- Js.string string_url;
			p, img

		let resize div p =
			let d = Dom_html.document##documentElement in

			let string_url_orig = Purl.to_string p.Gallery.dest in
			let info = Gallery_info.get string_url_orig in

			let frame_width = (d##clientWidth) - 100 in
			let frame_height = (d##clientHeight) - 60 in

			let frame_height =
				match info with
					| None -> frame_height
					| Some info ->
						let width = (float_of_int frame_height) *. info.Gallery_info.ratio in
						let fw = float_of_int frame_width in
						let fh = float_of_int frame_height in
						if width *. 1.4 > fw then
							let max_width = fw /. 1.4 in
							let ratio = width /. max_width in
							let height = int_of_float (fh /. ratio) in
							height
						else
							frame_height
			in

			div##style##height <- Js.string (string_of_int (frame_height+10) ^ "px");
			div##style##width <- Js.string ((string_of_int frame_width) ^ "px");
			div##style##height <- Js.string ((string_of_int frame_height) ^ "px");
			div##style##marginLeft <- Js.string ((string_of_int (-frame_width/2)) ^ "px");
			div##style##marginTop <- Js.string ((string_of_int (-frame_height/2)) ^ "px");
			div##style##marginTop <- Js.string ((string_of_int (-frame_height/2)) ^ "px");
			frame_width, frame_height

		let rec event_keypress ~has_next ~has_prev ~id div e =
			match e##keyCode with
				| 27 -> do_close div
				| 37 -> if has_prev then add_image div (id-1) else Lwt.return ()
				| 39 -> if has_next then add_image div (id+1) else Lwt.return ()
				| _ -> Lwt.return ()

		and add_image div id =
			Dom.removeChilds div;

			let (p, img) = preload_image id in

			let (frame_width, frame_height) = resize div p in

			let img_height = frame_height - 10 in

			img##className <- Js.string "gallery_view";
			img##height <- img_height;
			Dom.appendChild div img;
			img##style##opacity <- Js.def (Js.string "0");
			Js.Unsafe.set (img##style) (Js.string "transition") (Js.string "opacity 0.3s");
			lwt () = Lwt_js.sleep 0.05 in
			img##style##opacity <- Js.def (Js.string "1");

			let img_width = img##clientWidth in
			let div_width = div##clientWidth in

			(* neighbours *)
			let has_next =
				if id + 1 < List.length !list then
				begin
					let id_next = id + 1 in
					ignore (preload_image id_next);
					let div_next = Dom_html.createDiv Dom_html.document in
					div_next##className <- Js.string "gallery_view_next";
					div_next##style##height <- Js.string ((string_of_int img_height) ^ "px");
					div_next##style##marginLeft <- Js.string ((string_of_int (img_width-100+5)) ^ "px");
					div_next##style##lineHeight <- Js.string ((string_of_int (img_height)) ^ "px");
					div_next##innerHTML <- Js.string "→";

					div_next##onclick <- handler (fun _ -> add_image div id_next) Js._false;

					img##style##opacity <- Js.def (Js.string "1");
					Js.Unsafe.set (div_next##style) (Js.string "transition") (Js.string "opacity 0.3s");
					Dom.appendChild div div_next;
					true
				end
				else
					false
			in

			let has_prev =
				if id > 0 then
				begin
					let id_prev = id - 1 in
					ignore (preload_image id_prev);
					let div_prev = Dom_html.createDiv Dom_html.document in
					div_prev##className <- Js.string "gallery_view_prev";
					div_prev##style##height <- Js.string ((string_of_int img_height) ^ "px");
					div_prev##style##lineHeight <- Js.string ((string_of_int (img_height)) ^ "px");
					div_prev##onclick <- handler (fun _ -> add_image div id_prev) Js._false;
					div_prev##innerHTML <- Js.string "←";

					img##style##opacity <- Js.def (Js.string "1");
					Js.Unsafe.set (div_prev##style) (Js.string "transition") (Js.string "opacity 0.3s");
					Dom.appendChild div div_prev;
					true
				end
				else
					false
			in

			Dom_html.document##onkeydown <- handler (event_keypress ~has_next ~has_prev ~id div) Js._true;

			let right_width = Js.string ((string_of_int (div_width - img_width - 15)) ^ "px") in

			(* description main frame *)
			let div_descr_main = Dom_html.createDiv Dom_html.document in
			div_descr_main##className <- Js.string "gallery_view_description_main";
			div_descr_main##style##marginLeft <- Js.string ((string_of_int (img_width+10)) ^ "px");
			div_descr_main##style##height <- Js.string ((string_of_int img_height) ^ "px");
			div_descr_main##style##width <- right_width;
			Dom.appendChild div div_descr_main;

			(* description content frame *)
			let div_descr = Dom_html.createDiv Dom_html.document in
			div_descr##className <- Js.string "gallery_view_description_content";
			let content = Printf.sprintf "<h1>%s</h1>%s" !current_title (Html_print.elt_to_string p.G.description) in
			div_descr##innerHTML <- Js.string content;
			Dom.appendChild div_descr_main div_descr;

			(* close *)
			let close_img = Dom_html.createImg Dom_html.document in
			let string_url = Static.url Static.button_close in
			close_img##src <- Js.string string_url;
			close_img##className <- Js.string "gallery_view_close";
			close_img##style##marginLeft <- Js.string ((string_of_int (div_width-25)) ^ "px");
			close_img##style##marginTop <- Js.string ((string_of_int (-15)) ^ "px");
			close_img##onclick <- handler (close div) Js._true;
			Dom.appendChild div close_img;

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
			Dom.appendChild !body div;
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
			ignore (lwt () = Lwt_js.sleep 0.3 in add_image div id);

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
			img : Gallery.t;
			id : int;
			info : Gallery_info.t;
		}

		type row = {
			width : float;
			imgs : entry list;
		}

		type data = {
			current_id : int;
			row : row;
			list : Gallery.t list;
		}

		let empty = {
			width = 0.;
			imgs = [];
		}

		let add_to_row row img width = {
				width = row.width +. width;
				imgs = img :: row.imgs;
		}

		let output_row data =
			let ratio = data.row.width /. !max_width in
			let is_first = ref true in
			let output_one e =
				Firebug.console##log (Js.string (Printf.sprintf "== %i" e.id));
				let p = e.img in
				let div = Dom_html.createDiv Dom_html.document in
				if !is_first then
					div##className <- Js.string "gallery_preview_element gallery_preview_element_first"
				else	
					div##className <- Js.string "gallery_preview_element";

				let img = Dom_html.createImg Dom_html.document in
				img##onclick <- handler (click_processor e.id) Js._true;
				let string_url_256 = Purl.to_string p.Gallery.dest_256 in
				img##src <- Js.string string_url_256;
				Js.Unsafe.set (img##style) (Js.string "transition") (Js.string "width 0.3s, opacity 0.3s");
				img##width <- 0;
				img##style##opacity <- Js.def (Js.string "0");
				Dom.appendChild div img;
				Dom.appendChild !root div;
				is_first := false;
				lwt () = Lwt_js.sleep 0.05 in
				let width256 = 256. *. e.info.Gallery_info.ratio in
				let width = width256 /. ratio in
				Firebug.console##log (Js.string (Printf.sprintf "width256 = %f, width = %f" width256 width));
				img##width <- int_of_float width;
				img##style##opacity <- Js.def (Js.string "1");
				Lwt.return ()

			in
			Lwt_list.iter_s output_one (List.rev data.row.imgs)

		let add_one_preview data p =
			let string_url_orig = Purl.to_string p.Gallery.dest in
			let info = Gallery_info.get string_url_orig in
			match info with
				| None ->
					let list = List.filter ((<>) p) data.list in
					Lwt.return { data with list }
				| Some info ->
					let height = 256. in

					let width = height *. info.Gallery_info.ratio in

					let entry = { id = data.current_id; info; img = p } in

					let row = add_to_row data.row entry width in

					let data = { data with current_id = data.current_id + 1; row } in
					if row.width > !max_width then
						lwt () = output_row data in
						Lwt.return { data with row = empty }
					else
						Lwt.return data

		let draw () =
			Dom.removeChilds !root;
			max_width := float_of_int ((!root)##offsetWidth - 15);
			let data = { current_id = 0; row = empty; list = !list } in
			lwt data = Lwt_list.fold_left_s add_one_preview data !list in
			list := data.list;
			if data.row.width > 0. then
				output_row data
			else
				Lwt.return ()

		let resize () =
			draw ()

		let rec check_width_periodically old =
			let get_width () = (!root)##offsetWidth in
			lwt () = Lwt_js.sleep 0.5 in
			match old with
				| None ->
					check_width_periodically (Some (get_width ()))
				| Some old ->
					let w = get_width () in
					lwt () =
						if abs (w-old) > 20 then
							resize ()
						else
							Lwt.return ()
					in
					check_width_periodically (Some w)

		let init () =
			lwt root = init_root () in
			ignore (check_width_periodically None);
			let l = List.rev !Gallery.items in
			list := l;
			draw ()
	end

let view ?(pos=0) ?photo l =
	list := l;
	let pos = match photo with
		| None -> pos
		| Some p ->
			let rec find i = function
				| [] -> pos
				| hd :: tl ->
					if hd = p then
						i
					else
						find (i+1) tl
			in
			find 0 l
	in
	View.view pos

let js_view (title : Js.js_string Js.t) (pos : int) (arr : int Js.js_array Js.t) =
	let arr = Js.to_array arr in
	let l = Array.to_list arr in
	let l = Gallery.items_of_ids l in
	current_title := Js.to_string title;
	view ~pos l

let () =
	Js.Unsafe.set Dom_html.document (Js.string "gallery_view") js_view
