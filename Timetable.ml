
(* Combine the courses which have same colour
Return type will be a dictionary with key as color_code and value as list of courses *)

let combine colored_list = 
 let rec loop cl acc =
   match cl with 
     [] -> acc
   | (course, color) :: t -> let temp = Invertdict.add_to_dict color course acc in loop t temp

 in loop colored_list []




(* ------------------------------ Displaying the TimeTable----------------------------------------------------- *)

(* Function that returns the timetable given the dict such that it stores the courses which have same color*)
let make_timetable uniq_map = 
  List.iter (fun (x,y) -> print_endline("Time Slot " ^ string_of_int(x) ^ ":  " ^ (String.concat " " y))) uniq_map


(* ------------------------------ TIMETABLE READY----------------------------------------------------- *)





(* ------------------------------ Running Test Cases----------------------------------------------------- *)


(* -------- TESTCASE - 1 -----------------------*)
let course_list1 = ["C1"; "C2"; "C3"]
let participants_list1 = ["P1", "P2", "P3", "P4", "P5"]
let par_to_course_map1 = [("P1", ["C1"; "C3"]); ("P2", ["C1"; "C2"]); ("P3", ["C1"; "C2"]); ("P4", ["C2"]); ("P5", ["C3"])]


(* -------- TESTCASE - 2 -----------------------*)
let course_list2 = ["C1"; "C2"; "C3"; "C4"; "C5"]
let participants_list2 = ["P1", "P2", "P3", "P4", "P5"]
let par_to_course_map2 = [("P1", ["C3"]); ("P2", ["C1"; "C2"]); ("P3", ["C4"]); ("P4", ["C5"; "C3"]); ("P5", ["C1"])]



let run_testcase course_list participants_list par_to_course_map = 
  let () = print_endline("----------- Printing Timetable ------------") in
   let reg_data = par_to_course_map in
     let inverted_data = Invertdict.invert_dict reg_data in
       let inf_graph = Infgraph.inference_graph inverted_data in
         let colored_graph = Kcoloring.perform_k_colouring inf_graph in
           let final_coloured_graph = Kcoloring.remove_duplicates colored_graph in
             let combined_map = combine final_coloured_graph in
       make_timetable combined_map;;



run_testcase course_list1 participants_list1 par_to_course_map1;;
run_testcase course_list2 participants_list2 par_to_course_map2;;