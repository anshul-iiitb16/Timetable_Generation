val get_uniq_courses_list : ('a * 'a) list -> 'a list

val get_neighbours : 'a -> ('a * 'a) list -> 'a list

val get_neighbour_colour_pairs : 'a list -> ('a * 'b) list -> ('a * 'b) list

val get_list_of_used_colours : ('a * 'b) list -> 'b list

val get_list_of_untouched_colours : 'a list -> 'a list -> 'a list

val get_range_list : int -> int list

val backtrack : 'a list -> ('a * 'a) list -> int -> ('a * int) list

val perform_k_colouring : ('a * 'a) list -> ('a * int) list

val remove_duplicates : ('a * 'b) list -> ('a * 'b) list
