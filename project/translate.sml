use "tree.sml";
use "temp.sml";
use "MipsFrame.sml"

structure F = MipsFrame

signature TRANSLATE = sig
	type exp
	type level
	type access
	val unEx : exp -> Tree.exp
	val unNx : exp -> Tree.stm
	val unCx : exp -> (Temp.label * Temp.label -> Tree.stm)
	val simpleVar : access * level -> exp

end

structure Translate : TRANSLATE = struct

	datatype exp = Ex of Tree.exp
				 | Nx of Tree.stm
				 | Cx of Temp.label * Temp.label -> Tree.stm

	datatype level = TOPLEVEL
				   | NONTOP of {uniq:unit ref, parent: level, frame: F.frame}

	type access = level * F.access
				 
	fun unEx (Ex e) 	 = e
	  | unEx (Cx genstm) = let val r = Temp.newtemp()
	  						   val t = Temp.newlabel() and f = Temp.newlabel()
	  						in 
							  Tree.ESEQ(Tree.SEQ(Tree.MOVE(Tree.TEMP r, Tree.CONST 1), 
							  genstm(t,f), 
							  Tree.LABEL f, 
							  Tree.MOVE(Tree.TEMP r, Tree.CONST 0), 
							  Tree.LABEL t), 
							  Tree.TEMP r)
	  						end
	  | unEx (Nx s) 	 = Tree.ESEQ(s, Tree.CONST 0)
	
	fun unNx (Ex e) = Tree.EXP(e)
	  | unNx (Nx s) = s

	fun unCx (Ex (Tree.CONST 0)) = (fn(tlabel,flabel) => Tree.JUMP(Tree.NAME(flabel),[flabel]))
	  | unCx (Ex (Tree.CONST 1)) = (fn(tlabel,flabel) => Tree.JUMP(Tree.NAME(tlabel),[tlabel]))
	  | unCx (Ex e)				 = (fn(tlabel,flabel) => Tree.CJUMP(Tree.EQ,Tree.CONST 1,e,tlabel,flabel))
	  | unCx (Cx c)				 = c
	
	fun intEx (i) = Ex (Tree.CONST i)

	fun simpleVar ((declevel,fraccess), uselevel) = Ex(F.exp (fraccess, f))
	
	
	
end
