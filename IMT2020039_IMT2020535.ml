let course_list = ["C1"; "C2"; "C3"]

let participants_list = ["P1", "P2", "P3", "P4", "P5"]

let par_to_course_map = [("P1", ["C1"; "C3"]), ("P2", ["C1"; "C2"]), ("P3", ["C1"; "C2"]), ("P4", ["C2"]), ("P5", ["C3"])]


(* Add a key value pair (k, v) to the given dict d. *)
let rec add_to_dict key value dict = 
  match dict with
    [] -> [(key, [value])]
  | (k, v) :: t -> if key = k then
                     if List.mem value v = false then
                       (k, value :: v) :: t
                     else 
                       dict
                   else
                     (k, v) :: add_to_dict key value t



  
