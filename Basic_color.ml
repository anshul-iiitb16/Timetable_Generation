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

  
(* ------------------------------------------------ Naive Colouring Algorithm --------------------------------- *)
(* Naive Algo - Color every course differently*)
let basic_color inf_graph = 
  let course_list = get_uniq_courses_list inf_graph in
    let rec loop cl acc =
      match cl with 
        [] -> []
      | h :: t -> (h, acc) :: (loop t (acc+1))
    
    in loop course_list 1


 (* --------------------------------------------Naive Colouring Ends ----------------------------------------------------- *)
