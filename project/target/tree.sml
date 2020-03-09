use "temp.sml";
structure TREE = struct

datatype exp = CONST of LargeInt.int
         | NAME of Temp.label
         | TEMP of Temp.temp
         | BINOP of binop * exp * exp
         | MEM of exp
         | CALL of exp * exp list
         | ESEQ of stm * exp
     and stm = MOVE of exp * exp
         | EXP of exp
         | JUMP of exp * Temp.label list
         | CJUMP of relop * exp * exp * Temp.label * Temp.label
         | SEQ of stm * stm
         | LABEL of Temp.label
     and binop = PLUS | MINUS | MUL | DIV
         | AND | OR | LSHIFT | RSHIFT | ARSHIFT | XOR
     and relop = EQ | NE | LT | GT | LE | GE | ULT | ULE | UGT | UGE

end

