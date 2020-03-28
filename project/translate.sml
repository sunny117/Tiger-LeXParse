use "tree.sml";
use "temp.sml";
use "MipsFrame.sml"


structure F = MipsFrame

signature TRANSLATE = sig
	type exp

(* These are hidden and not for outside purpose.
	val unEx : exp -> Tree.exp
	val unNx : exp -> Tree.stm
	val unCx : exp -> (Temp.label * Temp.label -> Tree.stm)
*)

	val NIL : exp

	val intT : int -> exp
	val stringT : string -> exp
	val nilT : unit -> exp
	val binopT : Tree.binop * exp * exp -> exp
	val relopT : Tree.relop * exp * exp -> exp
	val assignT : exp * exp -> exp
	val ifT : exp * exp * exp -> exp
	val whileT : exp * exp * Temp.label -> exp
	val forT : exp * bool ref * exp * exp * exp * Temp.label -> exp
	val breakT : Temp.label -> exp




end

structure Translate : TRANSLATE = struct

	datatype exp = Ex of Tree.exp
				 | Nx of Tree.stm
				 | Cx of Temp.label * Temp.label -> Tree.stm

	val NIL = Ex(Tree.CONST 0)

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


	
	fun intT (x) = Ex(Tree.CONST x)

	(* Need MipsFrame
	fun stringT (s) = 
	*)

	fun nilT () = Ex(Tree.CONST 0)

	fun binopT (binop, l, r) = Ex(Tree.BINOP(binop, unEx(l), unEx(r)))

	fun relopT (relop, l, r) = Cx(fn(t,f) => Tree.CJUMP(relop, unEX(l), unEx(r), t, f))

	(* helper for assign translation to convert exp to location *)
	fun expconvertloc (Tree.MEM x) = Tree.MEMLOC x
	  | expconvertloc (Tree.TEMP x) = Tree.TEMPLOC x
	  | expconvertloc (Tree.ESEQ(x,y)) = Tree.ESEQLOC(x,y)
	  | expconvertloc _ = Tree.TEMPLOC(Temp.newtemp())

	fun assignT (l, r) = Nx(Tree.MOVE(expconvertloc(unEx l), unEx r))

	fun ifT (test, then', else') =
        let
            val genstm = unCx(test)
            val e2 = unEx(then')
            val e3 = unEx(else')
            val resulttemp = Temp.newtemp()
            val t = Temp.newlabel()
            val f = Temp.newlabel()
            val join = Temp.newlabel()
        in
            Ex(Tree.ESEQ(Tree.SEQ[
                genstm(t, f),
                Tree.LABEL(t), Tree.MOVE(Tree.TEMPLOC(resulttemp), e2), Tree.JUMP(Tree.NAME(join), [join]),
                Tree.LABEL(f), Tree.MOVE(Tree.TEMPLOC(resulttemp), e3), Tree.JUMP(Tree.NAME(join), [join])
            ], Tree.TEMP(resulttemp)))
        end


	fun whileT (test, body, breaklabel) =
        let
            val testlabel = Temp.newlabel()
            val bodylabel = Temp.newlabel()
            val test = unCx test
            val body = unNx body
        in
            Nx(Tree.SEQ[Tree.LABEL testlabel,
                      test (bodylabel, breaklabel),
                      Tree.LABEL(bodylabel),
                      body,
                      Tree.JUMP (Tree.NAME testlabel, [testlabel]),
                      Tree.LABEL breaklabel])
        end


    fun forT (varEx, escape, loEx, hiEx, bodyNx, breaklabel) = 
        let
            val var = unEx(varEx)
            val lo = unEx(loEx)
            val hi = unEx(hiEx)
            val body = unNx(bodyNx)
            val bodylabel = Temp.newlabel()
            val updatelabel = Temp.newlabel()
        in
            Nx(Tree.SEQ[Tree.MOVE(exp2loc var, lo),
                        Tree.CJUMP(Tree.LE, var, hi, bodylabel, breaklabel),
                        Tree.LABEL(bodylabel),
                        body,
                        Tree.CJUMP(Tree.LT, var, hi, updatelabel, breaklabel),
                        Tree.LABEL(updatelabel),
                        Tree.MOVE(exp2loc var, Tree.BINOP(Tree.PLUS, var, Tree.CONST 1)),
                        Tree.JUMP(Tree.NAME(bodylabel), [bodylabel]),
                        Tree.LABEL(breaklabel)])
        end

    fun breakT breaklabel = Nx(Tree.JUMP (Tree.NAME breaklabel, [breaklabel]))


	
	
end
