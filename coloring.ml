(* Naive Algo - Color every course differently*)
let basic_color list_courses = 
  let rec loop lc acc =
    match lc with 
      [] -> []
    | h :: t -> (h, acc) :: (loop t (acc+1))
    
  in loop list_courses 1

