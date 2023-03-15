
# TimeTable Generator Using Ocaml

Task is to prepare the time table for the courses provided the course registeration details. The generated timetable is valid only if it doesn’t have any schedule conflicts. A conflict arises when two interfering courses occupy the same or overlapping slot. Two courses are said to interfere if they have at least one common participant.

TimeTable Generation can be considered equivalent to as a Graph-Coloring problem. In the graph coloring problem, we need to color the nodes of a graph such that no adjacent nodes have the same color. Similarly, in the timetable generation problem, we need to assign time slots to courses such that no two courses with common participants are assigned the same time slot.We can represent the courses and their participants as nodes in a graph, and the common participants between two courses can be represented as edges between their corresponding nodes.



## Input
- **Course list**: Represented by a list of courses. 
- **Participant list**: Represented by a list of participant Id's
- **Registration Data**: It is the course registeration detail. A mapping from 
                
                            Participant −> Course list
## Approach 

PHASE 1:

-  We started with designing some intial testcases. Those are present in testcases folder.
-  Assumed **dictionary** as list of tuples. First element in the tuple is the key and second element is list of values. Registeration data has been represented in the form of dictionary only.
-  Then we implemented a function to **invert the dictionary**.  From that we were able to convert the Participant -> Course list map  to Course -> Participant list.


---------------------------------------------------------------------------
PHASE 2:

- Moving forward, from this map of Course -> Participant list, we generated the **Inference Graph**.  
- Interference Graph can be implemented as an **edge list**, where each edge is a pair (2-tuple) of nodes that have an edge between them.
- Each node in the Inference Graph represents a course.

---------------------------------------------------------------------------
PHASE 3:

- Next step is to color the graph such that no adjacent nodes have the same color. Basically this is a graph coloring problem.
- We applied **Backtracking** algrithm which basically searches in whole input space and tries to color the graph. 
- Reference - https://pencilprogrammer.com/algorithms/graph-coloring-problem/ 
- Along with Backtracking, we also have function implemented for **naive coloring** that colors each of the nodes differently. However Backtracking is better because it uses minimum number of colors to color the graph.

---------------------------------------------------------------------------
PHASE 4:

-  At last phase of our project, we genrate timtable by passing in the colored graph. 
- All the nodes which have same color are basicallythe courses taht don't have any conflict. Thus, these courses can be scheduled in the same time slot.



## Steps To Run The Code

- Keep all the files in one same directory.
- Add relevant testcases in the **Timetable.ml** file.
- Open the terminal in that directory itself.
- Run the following commands on terminal: 
    - **make**
    - **./final_timetable**
- **OUTPUT:**
    - After running the above commands, one will be able to see the generated timetable for the input testcases.




## Assumptions

- One Assumption that our coloring algorithm make is that Inference Graph should be a **CONNECTED GRAPH**.
- If you have unconected components, please run the code for those components separately. 

## Future Scope

- Cuurently, the Inference Algorithm is implemented as an Edge List. For efficient computations and better rrepresentation, one can represent the inference graph in the form of **Adjancy List or Matrix**.
- The coloring Algorithm i.e the Backtracking Algorithm is **exponential time**. One can implement other coloring algorithms such as **Chaitin's Algorithm** for faster computation.
## Authors

- [Anshul Jindal](https://github.com/anshul-iiitb16)
- [Shreeya Venneti](https://github.com/ShreeyaVenneti)

