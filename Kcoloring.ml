(* ------------------------------------------------------ K-Colouring Implementation ------------------------------------- *)

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

  
let get_neighbours course graph = 
  let rec loop c g acc = 
    match g with 
      [] -> acc
    | (c1,c2)::t -> if c1 = c then loop c t (c2 :: acc)
                    else if c2 = c then loop c t (c1 :: acc)
                    else loop c t acc
  
  in loop course graph []



let get_neighbour_colour_pairs neighbors_list colours =
    List.filter (fun (v, rem) -> List.mem v (neighbors_list)) colours


let get_list_of_used_colours neighbour_colour_pairs =
  let rec loop ncp acc = 
    match ncp with
      [] -> acc
    | (course, color) :: t -> loop t (color :: acc)

  in loop neighbour_colour_pairs []


let get_list_of_untouched_colours completed_colours all_colours =
    List.filter (fun c -> not (List.mem c completed_colours)) (all_colours)


let get_range_list k =
    let rec loop k acc = 
        if (acc = k) then [] 
        else acc :: loop k (acc + 1)
    
    in loop k 0


let backtrack courses_list graph k =
  let rec loop cl g k acc = 
    match cl with 
      [] -> acc
    | h::t ->   
                let neighbours_list = get_neighbours h g in 
                let neighbour_colour_pairs = get_neighbour_colour_pairs neighbours_list acc in
                let completed_colours = get_list_of_used_colours neighbour_colour_pairs in
                let all_colours = get_range_list k in
                let untouched_colours = get_list_of_untouched_colours completed_colours all_colours in
                match untouched_colours with
                    |   [] -> []
                    |   first_untouched_colour :: remaining_untouched_colours ->
                    let updated_list = ((h, first_untouched_colour) :: acc) in
                        match loop t g k updated_list  with
                          valid_k_colouring -> valid_k_colouring
                in loop courses_list graph k []



let rec perform_k_colouring graph =
  let courses_list = get_uniq_courses_list graph in
    let rec start_coloring graph k =
      let coloured_graph = backtrack courses_list graph k in
        if coloured_graph = [] then
          start_coloring graph (k+1)
        else coloured_graph

    in start_coloring graph 1


let remove_duplicates coloured_graph = 
let rec create acc l =
match l with
|   [] -> acc
|   (course, color) :: t -> 
    if ((List.mem (course,color) t) = false) then (course, color) :: create acc t
    else create acc t
in create [] coloured_graph


(* ------------------------------ Coloring Part Ends----------------------------------------------------- *)