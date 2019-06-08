
type t = {
    current : Purl.t;
    historic : Purl.t list;
  }

let make ?(historic=[]) current =
  { current; historic }
