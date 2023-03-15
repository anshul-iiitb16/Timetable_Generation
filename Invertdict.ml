(* ------------------------------ Inversion Part----------------------------------------------------- *)

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
    

(* ------------------------------ Inversion Part Ends----------------------------------------------------- *)
    
