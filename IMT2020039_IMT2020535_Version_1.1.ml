(*IMT2020039 - Anshul Jindal
IMT2020535 - Shreeya Venneti*)


(* Test case *)
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



(* Function to invert the dictionary *)
let invert_dict dict = 
  let rec loop dict acc = 
    match dict with
      [] -> acc
    | (k, v) :: t -> 
                        let rec add_loop k' v' acc1 = 
                          match v' with
                            [] -> loop t acc1
                          | h' :: t' -> let temp = add_to_dict h' k acc1 in 
                                          add_loop k' t' temp 


                        in add_loop k v acc 

  in loop dict []
    
    
(* Checks if two lists have any common element or not*)
let rec common list1 list2 = 
  match list1 with
    [] -> false
  | h::t ->     
                let rec loop h l2 list2 = 
                  match l2 with
                   [] -> common t list2
                  | h'::t' -> if h = h' then true
                            else loop h t' list2

                in loop h list2 list2



let inference_graph dict = 
  let rec loop dict acc =

    match dict with
      [] -> acc
    | (k, v) :: t -> 
                        let rec check k' v1' dict acc1 = 
                          match dict with
                            [] -> loop t acc1
                          | (k'', v') :: t' ->  
                                                if common v1' v' then
                                                  let temp = (k', k'') :: acc1 in check k' v1' t' temp
                                                else
                                                  check k' v1' t' acc1

                        in check k v t acc

  in loop dict [] 