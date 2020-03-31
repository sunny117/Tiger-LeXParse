signature TRANSLATE = sig
	type exp
	type level
	type access

	val outermost : level
    val newLevel : {parent: level, name: Temp.label, formals: bool list} -> level
    val formals : level -> access list
    val allocLocal : level -> bool -> access

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

  val arrayT : exp * exp -> exp
  val subscriptT : exp * exp -> exp
  val recordT : exp list -> exp
  val fieldT : exp * int -> exp
  val sequencingT : exp list -> exp

  val simpleVarT : access * level -> exp

  val procEntryExit : {level: level, body: exp} -> unit
  val getResult : unit -> MipsFrame.frag list
  val resetFragList : unit -> unit

end

structure Translate : TRANSLATE = struct

	datatype exp = Ex of Tree.exp
				 | Nx of Tree.stm
				 | Cx of Temp.label * Temp.label -> Tree.stm

	datatype level = TOPLEVEL
      			   | NONTOP of {uniq: unit ref, parent: level, frame: MipsFrame.frame}
    
	type access = level * MipsFrame.access

	val fragList = ref [] : MipsFrame.frag list ref

    val outermost = TOPLEVEL

    fun newLevel {parent, name, formals} = 
        let
            val formals'= true::formals
        in
            NONTOP({uniq = ref (), parent=parent, frame=MipsFrame.newFrame {name=name, formals=formals'}})
        end

    fun formals TOPLEVEL = []
      | formals (curlevel as NONTOP{uniq, parent, frame}) = 
            let
                fun addLevel (faccess, l) = (curlevel, faccess)::l
            in
                foldl addLevel [] (MipsFrame.formals frame)
            end

	fun allocLocal level' escape' = 
      case level' of
           NONTOP({uniq=uniq', parent=parent', frame=frame'}) => (NONTOP({uniq=uniq', parent=parent', frame=frame'}), MipsFrame.allocLocal frame' escape')
         | TOPLEVEL => (outermost, MipsFrame.allocLocal (MipsFrame.newFrame {name=Temp.newlabel(), formals=[]}) escape')

	fun unEx (Ex e) 	 = e
	  | unEx (Cx genstm) = let val r = Temp.newtemp()
	  						   val t = Temp.newlabel() and f = Temp.newlabel()
	  						in 
							  Tree.ESEQ(Tree.SEQ([Tree.MOVE(Tree.TEMPLOC r, Tree.CONST 1), 
							  genstm(t,f), 
							  Tree.LABEL f, 
							  Tree.MOVE(Tree.TEMPLOC r, Tree.CONST 0), 
							  Tree.LABEL t]), 
							  Tree.TEMP r)
	  						end
	  | unEx (Nx s) 	 = Tree.ESEQ(s, Tree.CONST 0)
	
	fun unNx (Ex e) = Tree.EXP(e)
	  | unNx (Nx s) = s

	fun unCx (Ex (Tree.CONST 0)) = (fn(tlabel,flabel) => Tree.JUMP(Tree.NAME(flabel),[flabel]))
	  | unCx (Ex (Tree.CONST 1)) = (fn(tlabel,flabel) => Tree.JUMP(Tree.NAME(tlabel),[tlabel]))
	  | unCx (Ex e)				 = (fn(tlabel,flabel) => Tree.CJUMP(Tree.EQ,Tree.CONST 1,e,tlabel,flabel))
	  | unCx (Cx c)				 = c

	val NIL = Ex(Tree.CONST 0)
	
	fun intT (x) = Ex(Tree.CONST x)

	fun stringT (lit) = 
        let
          fun checkFragLit(frag) =
            case frag of 
                 MipsFrame.PROC(_) => false
               | MipsFrame.STRING(lab', lit') => String.compare(lit', lit) = EQUAL
          fun genFragLabel() =
            case List.find checkFragLit (!fragList) of
                 SOME(MipsFrame.STRING(lab', lit')) => lab'
               | _ => 
                   let
                     val lab' = Temp.newlabel()
                   in
                      fragList := MipsFrame.STRING(lab', lit)::(!fragList);
                      MipsFrame.STRING(lab', lit)::(!fragList);
                      lab'
                   end
          val lab = genFragLabel()
        in
          Ex(Tree.NAME(lab))
        end 

	fun nilT () = Ex(Tree.CONST 0)

	fun binopT (binop, l, r) = Ex(Tree.BINOP(binop, unEx(l), unEx(r)))

	fun relopT (relop, l, r) = Cx(fn(t,f) => Tree.CJUMP(relop, unEx(l), unEx(r), t, f))

	(* helper for assign translation to convert exp to location *)
	fun exp2loc (Tree.MEM x) = Tree.MEMLOC x
	  | exp2loc (Tree.TEMP x) = Tree.TEMPLOC x
	  | exp2loc (Tree.ESEQ(x,y)) = Tree.ESEQLOC(x,y)
	  | exp2loc _ = Tree.TEMPLOC(Temp.newtemp())

	fun assignT (l, r) = Nx(Tree.MOVE(exp2loc(unEx l), unEx r))

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


    fun arrayT (sizeEx, initEx) =
          Ex(MipsFrame.externalCall("initArray", [unEx sizeEx, unEx initEx]))

    fun subscriptT (arrEx, indexEx) =
          let
              val addr = Temp.newtemp()
              val arr = unEx arrEx
              val index = unEx indexEx
          in
              Ex(Tree.ESEQ(
                Tree.MOVE(Tree.TEMPLOC(addr),
                        Tree.BINOP(Tree.PLUS, arr,
                                  Tree.BINOP(Tree.MUL, index, Tree.CONST(MipsFrame.wordSize)))),
                Tree.MEM(Tree.TEMP(addr))))
          end

    fun recordT (exps) =
          let
              val n = length exps
              val r = Temp.newtemp()
              val recordInit = Tree.MOVE(Tree.TEMPLOC(r), MipsFrame.externalCall("initRecord", [Tree.CONST n]))
              fun setField (exp, elem) = Tree.MOVE((Tree.MEMLOC(
                                                      Tree.BINOP(Tree.PLUS, Tree.TEMP(r), Tree.CONST(MipsFrame.wordSize * elem)))), 
                                                      unEx exp)
              fun instantiateFields ([]) = [recordInit]
                | instantiateFields (head :: l) = (setField(head, length l)) :: (instantiateFields (l))
              fun convert ([]) = Tree.EXP(Tree.CONST 0)
                | convert ([s]) = s
                | convert (f::t) = Tree.SEQ([f, convert(t)])
          in
              Ex(Tree.ESEQ(
                  convert(rev(instantiateFields(exps))), 
                  Tree.TEMP(r)))
          end

    fun fieldT (nameEx, elem) =
          Ex(Tree.MEM(Tree.BINOP(
                      Tree.PLUS, unEx nameEx, 
                      Tree.BINOP(Tree.MUL, Tree.CONST(elem), Tree.CONST (MipsFrame.wordSize)))))

    fun sequencingT [] = Ex (Tree.CONST 0)
      | sequencingT [exp] = exp
      | sequencingT (head :: l) = Ex (Tree.ESEQ (unNx head, unEx (sequencingT l)))

    fun followSLs TOPLEVEL TOPLEVEL bestguess = ( bestguess)
              | followSLs TOPLEVEL _ bestguess = (bestguess)
              | followSLs _ TOPLEVEL bestguess = (bestguess)
              | followSLs (declevel as NONTOP{uniq=uniqdec, parent=_, frame=_}) (uselevel as NONTOP{uniq=uniquse, parent=useparent, frame=_}) bestguess =
                    if uniqdec = uniquse
                    then bestguess
                    else followSLs declevel useparent (Tree.MEM bestguess)

    fun simpleVarT ((declevel, fraccess), uselevel) =
        Ex(MipsFrame.exp (fraccess, followSLs declevel uselevel (Tree.TEMP MipsFrame.FP)))

    fun callexpT (TOPLEVEL, calllevel, label, args) = Ex (Tree.TEMP MipsFrame.FP)
      | callexpT (declevel as NONTOP{uniq, parent, frame}, calllevel, label, args) =
        let
            val sl = followSLs parent calllevel (Tree.TEMP MipsFrame.FP)
            val unExedArgs = map unEx args
        in
            Ex (Tree.CALL (Tree.NAME label, sl :: unExedArgs))
        end

    fun procEntryExit({level=level', body=body'}) = 
        let
          val levelFrame =
            case level' of
                TOPLEVEL => (MipsFrame.newFrame {name=Temp.newlabel(), formals=[]})
              | NONTOP({uniq=_, parent=_, frame=frame'}) => frame'
          val treeBody = unNx body'
        in
          fragList := MipsFrame.PROC({body=treeBody, frame=levelFrame})::(!fragList)
        end
        
    fun getResult() = !fragList

    fun resetFragList() = fragList := []

    fun concatExpList(expList, body as exp') =
        let
          fun createExpListStm(a::l) = unNx(a)::createExpListStm(l)
            | createExpListStm([]) = []
        in
          Ex(Tree.ESEQ(Tree.SEQ(createExpListStm expList), unEx(exp')))
        end
end
