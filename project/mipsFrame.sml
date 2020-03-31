signature FRAME = sig
    type access
    type frame
    datatype frag = PROC of {body: Tree.stm, frame: frame}
                  | STRING of Temp.label * string

    val FP : Temp.temp
    val wordSize : int
    val exp : access * Tree.exp -> Tree.exp
    val newFrame : {name: Temp.label, formals: bool list} -> frame
    val name : frame -> Temp.label
    val formals : frame -> access list
    val allocLocal : frame -> bool -> access

    val externalCall : string * Tree.exp list -> Tree.exp
    val procEntryExit1 : frame * Tree.stm -> Tree.stm
    
end

structure MipsFrame : FRAME = struct
    datatype access = InFrame of int | InReg of Temp.temp
    type frame = {name: Temp.label, formals: access list,
                    numLocals: int ref, curOffset: int ref}
    datatype frag = PROC of {body: Tree.stm, frame: frame}
                  | STRING of Temp.label * string

    val FP = Temp.newtemp()
    val wordSize = 4

    fun exp (fraccess, frameaddr) = 
        case fraccess of
            InFrame offset => Tree.MEM(Tree.BINOP(Tree.PLUS, frameaddr, Tree.CONST offset))
          | InReg temp => Tree.TEMP(temp)

    val ARGREGS = 4 (* registers allocated for arguments in mips *)

    fun name {name=name, formals=_, numLocals=_, curOffset=_} = name
    fun formals {name=_, formals=formals, numLocals=_, curOffset=_} = formals
    
    fun newFrame {name, formals} = 
        let
            fun allocFormals(offset, [], allocList, numRegs) = allocList
              | allocFormals(offset, curFormal::l, allocList, numRegs) = 
                  (
                  case curFormal of
                       true => allocFormals(offset + wordSize, l, (InFrame offset)::allocList, numRegs)
                     | false => 
                         if numRegs < ARGREGS
                         then allocFormals(offset, l, (InReg(Temp.newtemp()))::allocList, numRegs + 1)
                         else allocFormals(offset + wordSize, l, (InFrame offset)::allocList, numRegs)
                  )
        in
            {name=name, formals=allocFormals(0, formals, [], 0),
            numLocals=ref 0, curOffset=ref 0}
        end

    fun allocLocal frame' escape = 
        let
            fun incrementNumLocals {name=_, formals=_, numLocals=x, curOffset=_} = x := !x + 1
            fun incrementOffset {name=_, formals=_, numLocals=_, curOffset=x} = x := !x - wordSize
            fun getOffsetValue {name=_, formals=_, numLocals=_, curOffset=x} = !x
        in
            incrementNumLocals frame';
            case escape of
                true => (incrementOffset frame'; InFrame(getOffsetValue frame'))
              | false => InReg(Temp.newtemp())
        end

    fun externalCall (s, args) =
      Tree.CALL(Tree.NAME(Temp.namedlabel s), args)

    fun procEntryExit1(frame', stm') = stm'

end