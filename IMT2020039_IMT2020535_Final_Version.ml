(*IMT2020039 - Anshul Jindal
IMT2020535 - Shreeya Venneti*)


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




(* ------------------------------ Coloring Part Starts----------------------------------------------------- *)

let get_uniq_courses_list inf_graph = 
  let rec loop g acc = 
    match g with 
      [] -> acc
    | (c1, c2) :: t -> if List.mem c1 acc = false && List.mem c2 acc = false then
                         let temp = c2 :: c1 :: acc in loop t temp
                       else if List.mem c1 acc = true && List.mem c2 acc = false then
                         let temp = c2 :: acc in loop t temp
                       else if List.mem c1 acc = false && List.mem c2 acc = true then
                         let temp = c1 :: acc in loop t temp
                       else
                         loop t acc

  in loop inf_graph []


(* Naive Algo - Color every course differently*)
let basic_color inf_graph = 
  let course_list = get_uniq_courses_list inf_graph in
    let rec loop cl acc =
      match cl with 
        [] -> []
      | h :: t -> (h, acc) :: (loop t (acc+1))
    
    in loop course_list 1



(* Combine the courses which have same colour
 Return type will be a dictionary with key as color_code and value as list of courses *)
let combine colored_list = 
 let rec loop cl acc =
   match cl with 
     [] -> acc
   | (course, color) :: t -> let temp = add_to_dict color course acc in loop t temp

 in loop colored_list []

(* ------------------------------ Coloring Part Ends----------------------------------------------------- *)

