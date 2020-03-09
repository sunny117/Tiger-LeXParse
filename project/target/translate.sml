use "tree.sml";
use "temp.sml";
structure Translate = struct
	structure T = TREE

	datatype exp = Ex of T.exp
				 | Nx of T.stm
				 | Cx of label
				 
	fun unEx (Ex e) = e
	  | unEx (Cx genstm) = let val r = Temp.newtemp()
	  						   val t = Temp.newlabel() and f = Temp.newlabel()
	  						in T.ESEQ(T.SEQ(T.MOVE(T.TEMP r, T.CONST 1), genstm(t,f), T.LABEL f, T.MOVE(T.TEMP r, T.CONST 0), T.LABEL t), T.TEMP r)
	  						end
	  | unEx (Nx s) = T.ESEQ(s, T.CONST 0)
	  
	
	fun intEx (i) = Ex (T.CONST i)
	
	
	
end
