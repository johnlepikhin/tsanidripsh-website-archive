
let () =
	let module P = P_main in
	let module P = P_gallery in
	let module P = P_prices in
	let module P = P_tours in
	let module P = P_feedbacks in
	let module P = P_questions in
	let module P = P_contacts in
	let module P = P_information in
	let module P = P_gallery_all in
	let module P = P_old_testimonials in
	let module P = P_old_tours_afon in
	let module P = P_a_tsandripsh in
	let module P = P_billing in
	let module P = P_rooms in
	let module P = P_new_year in
	Install_path.create_all ();
	if Array.length Sys.argv > 1 && Sys.argv.( 1 ) = "gallery" then
		Install_gallery.create_all ();
	Install_static.create_all ();
	Install_page.create_all ()
