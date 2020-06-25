signature CANON = 
sig
    val linearize : Tree.stm -> Tree.stm list
    val basicBlocks : Tree.stm list -> (Tree.stm list list * Tree.label)
    val traceSchedule : Tree.stm list list * Tree.label -> Tree.stm list
end

structure Canon : CANON = 
struct

 fun linearize(stm0: Tr.stm) : Tr.stm list =
 let
  infix %
  fun (Tr.EXP(Tr.CONST _)) % x = x
    | x % (Tr.EXP(Tr.CONST _)) = x
    | x % y = Tr.SEQ(x,y)

  fun commute(Tr.EXP(Tr.CONST _), _) = true
    | commute(_, Tr.NAME _) = true
    | commute(_, Tr.CONST _) = true
    | commute _ = false

  val nop = Tr.EXP(Tr.CONST 0)

  fun reorder ((e as Tr.CALL _ )::rest) =
	let val t = Temp.newtemp()
	 in reorder(Tr.ESEQ(Tr.MOVE(Tr.TEMPLOC t, e), Tr.TEMP t) :: rest)
	end
    | reorder (a::rest) =
	 let val (stms,e) = do_exp a
	     val (stms',el) = reorder rest
	  in if commute(stms',e)
	     then (stms % stms',e::el)
	     else let val t = Temp.newtemp()
		   in (stms % Tr.MOVE(Tr.TEMPLOC t, e) % stms', Tr.TEMP t :: el)
		  end
	 end
    | reorder nil = (nop,nil)

  and reorder_exp(el,build) = let val (stms,el') = reorder el
                        in (stms, build el')
                       end

  and reorder_stm(el,build) = let val (stms,el') = reorder (el)
		 	 in stms % build(el')
			end

  and do_stm(Tr.SEQ(a,b)) = 
               do_stm a % do_stm b
    | do_stm(Tr.JUMP(e,labs)) = 
	       reorder_stm([e],fn [e] => Tr.JUMP(e,labs))
    | do_stm(Tr.CJUMP(p,a,b,t,f)) = 
               reorder_stm([a,b], fn[a,b]=> Tr.CJUMP(p,a,b,t,f))
    | do_stm(Tr.MOVE(Tr.TEMPLOC t,Tr.CALL(e,el))) = 
               reorder_stm(e::el,fn e::el => Tr.MOVE(Tr.TEMPLOC t,Tr.CALL(e,el)))
    | do_stm(Tr.MOVE(Tr.TEMPLOC t,b)) = 
	       reorder_stm([b],fn[b]=>Tr.MOVE(Tr.TEMPLOC t,b))
    | do_stm(Tr.MOVE(Tr.MEMLOC e,b)) = 
	       reorder_stm([e,b],fn[e,b]=>Tr.MOVE(Tr.MEMLOC e,b))
    | do_stm(Tr.MOVE(Tr.ESEQLOC(s,e),b)) = 
	       do_stm(Tr.SEQ(s,Tr.MOVE(e,b)))
    | do_stm(Tr.EXP(Tr.CALL(e,el))) = 
	       reorder_stm(e::el,fn e::el => Tr.EXP(Tr.CALL(e,el)))
    | do_stm(Tr.EXP e) = 
	       reorder_stm([e],fn[e]=>Tr.EXP e)
    | do_stm s = reorder_stm([],fn[]=>s)

  and do_exp(Tr.BINOP(p,a,b)) = 
                 reorder_exp([a,b], fn[a,b]=>Tr.BINOP(p,a,b))
    | do_exp(Tr.MEM(a)) = 
		 reorder_exp([a], fn[a]=>Tr.MEM(a))
    | do_exp(Tr.ESEQ(s,e)) = 
		 let val stms = do_stm s
		     val (stms',e) = do_exp e
		  in (stms%stms',e)
		 end
    | do_exp(Tr.CALL(e,el)) = 
		 reorder_exp(e::el, fn e::el => Tr.CALL(e,el))
    | do_exp e = reorder_exp([],fn[]=>e)

  (* linear gets rid of the top-level SEQ's, producing a list *)
  fun linear(Tr.SEQ(a,b),l) = linear(a,linear(b,l))
    | linear(s,l) = s::l

 in
    linear(do_stm stm0, nil)t = saytemp src)
     
 end
end
