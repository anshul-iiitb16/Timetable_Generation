(* ------------------------------ Constructing Inference Graph----------------------------------------------------- *)

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


(* Function to create inference graph in the form of an edge list *)
(* The function adds an edge between two courses whenever the 2 courses have atleast one common participant *)
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


(* ------------------------------ Inference Graph Done ----------------------------------------------------- *)


