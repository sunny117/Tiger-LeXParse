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

  type block = Tr.stm list

  fun basicBlocks stms = 
     let val done = Temp.newlabel()
         fun blocks((head as Tr.LABEL _) :: tail, blist) =
	     let fun next((s as (Tr.JUMP _))::rest, thisblock) =
		                endblock(rest, s::thisblock)
		   | next((s as (Tr.CJUMP _))::rest, thisblock) =
                                endblock(rest,s::thisblock)
		   | next(stms as (Tr.LABEL lab :: _), thisblock) =
                                next(Tr.JUMP(Tr.NAME lab,[lab]) :: stms, thisblock)
		   | next(s::rest, thisblock) = next(rest, s::thisblock)
		   | next(nil, thisblock) = 
			     next([Tr.JUMP(Tr.NAME done, [done])], thisblock)
		 
		 and endblock(stms, thisblock) = 
		            blocks(stms, rev thisblock :: blist)
		     
	     in next(tail, [head])
	     end
	   | blocks(nil, blist) = rev blist
	   | blocks(stms, blist) = blocks(Tr.LABEL(Temp.newlabel())::stms, blist)
     in
        (blocks(stms,nil), done)
     end

  fun enterblock(b as (Tr.LABEL s :: _), table) = Symbol.enter(table,s,b)
    | enterblock(_, table) = table

  fun splitlast([x]) = (nil,x)
    | splitlast(h::t) = let val (t',last) = splitlast t in (h::t', last) end

  fun trace(table,b as (Tr.LABEL lab :: _),rest) = 
   let val table = Symbol.enter(table, lab, nil)
    in case splitlast b
     of (most,Tr.JUMP(Tr.NAME lab, _)) =>
	  (case Symbol.look(table, lab)
            of SOME(b' as _::_) => most @ trace(table, b', rest)
	     | _ => b @ getnext(table,rest))
      | (most,Tr.CJUMP(opr,x,y,t,f)) =>
          (case (Symbol.look(table,t), Symbol.look(table,f))
            of (_, SOME(b' as _::_)) => b @ trace(table, b', rest)
             | (SOME(b' as _::_), _) => 
		           most @ [Tr.CJUMP(Tr.notRel opr,x,y,f,t)]
		                @ trace(table, b', rest)
             | _ => let val f' = Temp.newlabel()
		     in most @ [Tr.CJUMP(opr,x,y,t,f'), 
				Tr.LABEL f', Tr.JUMP(Tr.NAME f,[f])]
			     @ getnext(table,rest)
                        end)
      | (most, Tr.JUMP _) => b @ getnext(table,rest)
     end

  and getnext(table,(b as (Tr.LABEL lab::_))::rest) = 
           (case Symbol.look(table, lab)
             of SOME(_::_) => trace(table,b,rest)
              | _ => getnext(table,rest))
    | getnext(table,nil) = nil

  fun traceSchedule(blocks,done) = 
       getnext(foldr enterblock Symbol.empty blocks, blocks)
         @ [Tr.LABEL done]

end
