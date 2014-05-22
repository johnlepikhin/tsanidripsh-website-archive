
module M
	: sig
		type t

		val make: unit -> t

		val to_string: t -> string
	end
	= struct
		type t = int

		let make =
			let i = ref 0 in
			fun () ->
				incr i;
				!i

		let to_string t =
			string_of_int t
	end

include M
