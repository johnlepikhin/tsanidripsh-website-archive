
let () =
	let module P1 = P_main in
	let module P2 = P_gallery in
	let module P3 = P_prices in
	let module P4 = P_tours in
	let module P5 = P_feedbacks in
	let module P6 = P_questions in
	let module P7 = P_contacts in
	let module P8 = P_information in
	let module P9 = P_gallery_all in
	let module P10 = P_old_testimonials in
	let module P11 = P_old_tours_afon in
	Install_path.create_all ();
	if Array.length Sys.argv > 1 && Sys.argv.( 1 ) = "gallery" then
		Install_gallery.create_all ();
	Install_static.create_all ();
	Install_page.create_all ()
