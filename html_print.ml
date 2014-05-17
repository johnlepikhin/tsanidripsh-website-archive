
module Printer = Html5.P

let to_string doc =
	let out = ref "" in
	Printer.print ~output:(fun s -> out := !out ^ s) doc;
	!out

let elt_to_string elt =
	let out = ref "" in
	Printer.print_list ~output:(fun s -> out := !out ^ s) [elt];
	!out

let print doc =
	let s = to_string doc in
	print_endline s
