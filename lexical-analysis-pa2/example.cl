(* models one-dimensional cellular automaton on a circle of finite radius
   arrays are faked as Strings,
   X's respresent live cells, dots represent dead cells,
   no error checking is done *)
class CellularAutomaton inherits IO {}
[]
<-
            	+ if cell_left_neighbor(position) = "X" then 1 else 0 fi

            '.'
-- ABC
class

(* (* *) dadadaddada







