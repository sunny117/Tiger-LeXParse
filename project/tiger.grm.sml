functor ExprLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Expr_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(*#line 1.2 "tiger.grm"*)

(*#line 13.1 "tiger.grm.sml"*)
end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\017\000\002\000\016\000\000\000\
\\001\000\002\000\011\000\009\000\010\000\011\000\009\000\012\000\008\000\
\\015\000\007\000\017\000\006\000\020\000\005\000\000\000\
\\001\000\002\000\018\000\000\000\
\\001\000\003\000\029\000\004\000\028\000\005\000\027\000\006\000\026\000\
\\018\000\043\000\000\000\
\\001\000\003\000\029\000\004\000\028\000\005\000\027\000\006\000\026\000\
\\019\000\046\000\000\000\
\\001\000\003\000\029\000\004\000\028\000\005\000\027\000\006\000\026\000\
\\021\000\025\000\000\000\
\\001\000\007\000\000\000\000\000\
\\001\000\010\000\032\000\000\000\
\\001\000\013\000\031\000\000\000\
\\001\000\014\000\044\000\000\000\
\\001\000\016\000\022\000\000\000\
\\001\000\016\000\030\000\000\000\
\\001\000\019\000\024\000\000\000\
\\049\000\000\000\
\\050\000\002\000\011\000\008\000\013\000\009\000\010\000\011\000\009\000\
\\012\000\008\000\015\000\007\000\017\000\006\000\020\000\005\000\000\000\
\\050\000\002\000\011\000\009\000\010\000\011\000\009\000\012\000\008\000\
\\015\000\007\000\017\000\006\000\020\000\005\000\000\000\
\\051\000\000\000\
\\052\000\000\000\
\\053\000\003\000\029\000\004\000\028\000\005\000\027\000\006\000\026\000\000\000\
\\054\000\000\000\
\\055\000\000\000\
\\056\000\000\000\
\\057\000\003\000\029\000\004\000\028\000\005\000\027\000\006\000\026\000\000\000\
\\058\000\000\000\
\\059\000\000\000\
\\060\000\000\000\
\\061\000\000\000\
\\062\000\005\000\027\000\006\000\026\000\000\000\
\\063\000\005\000\027\000\006\000\026\000\000\000\
\\064\000\000\000\
\\065\000\000\000\
\\066\000\003\000\029\000\004\000\028\000\005\000\027\000\006\000\026\000\000\000\
\"
val actionRowNumbers =
"\015\000\013\000\014\000\000\000\
\\002\000\021\000\015\000\001\000\
\\000\000\010\000\017\000\015\000\
\\012\000\005\000\026\000\025\000\
\\011\000\008\000\019\000\007\000\
\\000\000\016\000\001\000\000\000\
\\000\000\000\000\000\000\000\000\
\\000\000\015\000\000\000\022\000\
\\024\000\031\000\030\000\029\000\
\\028\000\027\000\003\000\009\000\
\\018\000\000\000\020\000\004\000\
\\001\000\023\000\006\000"
val gotoT =
"\
\\001\000\002\000\002\000\001\000\003\000\046\000\000\000\
\\000\000\
\\001\000\002\000\002\000\010\000\000\000\
\\004\000\013\000\005\000\012\000\000\000\
\\000\000\
\\000\000\
\\001\000\002\000\002\000\017\000\000\000\
\\001\000\018\000\000\000\
\\004\000\013\000\005\000\019\000\000\000\
\\000\000\
\\000\000\
\\001\000\002\000\002\000\021\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\004\000\031\000\000\000\
\\000\000\
\\001\000\032\000\000\000\
\\004\000\033\000\000\000\
\\004\000\034\000\000\000\
\\004\000\035\000\000\000\
\\004\000\036\000\000\000\
\\004\000\037\000\000\000\
\\004\000\038\000\000\000\
\\001\000\002\000\002\000\039\000\000\000\
\\004\000\040\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\004\000\043\000\000\000\
\\000\000\
\\000\000\
\\001\000\045\000\000\000\
\\000\000\
\\000\000\
\"
val numstates = 47
val numrules = 18
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit | VAR of  (string) | CONST of  (int) | EQ of  (Ast.Expr) | EXPR of  (Ast.Expr) | PROGRAM of  (Ast.Expr list) | EXPS of  (Ast.Expr list) | EXP of  (Ast.Expr)
end
type svalue = MlyValue.svalue
type result = Ast.Expr list
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn (T 6) => true | _ => false
val showTerminal =
fn (T 0) => "CONST"
  | (T 1) => "VAR"
  | (T 2) => "PLUS"
  | (T 3) => "MINUS"
  | (T 4) => "MUL"
  | (T 5) => "DIV"
  | (T 6) => "EOF"
  | (T 7) => "SEMICOLON"
  | (T 8) => "IF"
  | (T 9) => "THEN"
  | (T 10) => "ELSE"
  | (T 11) => "LET"
  | (T 12) => "IN"
  | (T 13) => "END"
  | (T 14) => "BREAK"
  | (T 15) => "ASSIGNMENT"
  | (T 16) => "FOR"
  | (T 17) => "TO"
  | (T 18) => "DO"
  | (T 19) => "WHILE"
  | (T 20) => "EQUAL"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 3) $$ (T 2)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.EXPS EXPS, EXPS1left, EXPS1right)) :: rest671)) => let val  result = MlyValue.PROGRAM ((*#line 35.33 "tiger.grm"*) EXPS (*#line 238.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, EXPS1left, EXPS1right), rest671)
end
|  ( 1, ( rest671)) => let val  result = MlyValue.EXPS ((*#line 37.34 "tiger.grm"*) []            (*#line 242.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, defaultPos, defaultPos), rest671)
end
|  ( 2, ( ( _, ( MlyValue.EXPS EXPS, _, EXPS1right)) :: _ :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 38.24 "tiger.grm"*) EXP :: EXPS	(*#line 246.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXPS1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.EXPS EXPS, _, EXPS1right)) :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 39.15 "tiger.grm"*) EXP :: EXPS	(*#line 250.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXPS1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.EXPR EXPR, _, EXPR1right)) :: _ :: ( _, ( MlyValue.EQ EQ, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 41.34 "tiger.grm"*) Ast.IF EQ EXPR (*#line 254.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, IF1left, EXPR1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: ( _, ( _, ELSE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 42.23 "tiger.grm"*) Ast.ELSE  EXP (*#line 258.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ELSE1left, EXP1right), rest671)
end
|  ( 6, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.EXPS EXPS2, _, _)) :: _ :: ( _, ( MlyValue.EXPS EXPS1, _, _)) :: ( _, ( _, LET1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 43.27 "tiger.grm"*) Ast.LET EXPS1 EXPS2 (*#line 262.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LET1left, END1right), rest671)
end
|  ( 7, ( ( _, ( _, BREAK1left, BREAK1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 44.14 "tiger.grm"*) Ast.Break	(*#line 266.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, BREAK1left, BREAK1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.EXPR EXPR, _, EXPR1right)) :: _ :: ( _, ( MlyValue.VAR VAR, VAR1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 45.26 "tiger.grm"*) Ast.ASSIGNMENT (Ast.Var VAR) EXPR(*#line 270.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, VAR1left, EXPR1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.EXPR EXPR2, _, _)) :: _ :: ( _, ( MlyValue.EXPR EXPR1, _, _)) :: _ :: ( _, ( MlyValue.VAR VAR, _, _)) :: ( _, ( _, FOR1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 46.44 "tiger.grm"*)Ast.FOR (Ast.Var VAR) EXPR1 EXPR2 EXP(*#line 274.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, FOR1left, EXP1right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.EQ EQ, _, _)) :: ( _, ( _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 47.22 "tiger.grm"*) Ast.WHILE EQ EXP (*#line 278.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, WHILE1left, EXP1right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.CONST CONST, CONST1left, CONST1right)) :: rest671)) => let val  result = MlyValue.EXPR ((*#line 49.32 "tiger.grm"*) Ast.Const CONST 	(*#line 282.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, CONST1left, CONST1right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.VAR VAR, VAR1left, VAR1right)) :: rest671)) => let val  result = MlyValue.EXPR ((*#line 50.12 "tiger.grm"*) Ast.Var VAR 		(*#line 286.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, VAR1left, VAR1right), rest671)
end
|  ( 13, ( ( _, ( MlyValue.EXPR EXPR2, _, EXPR2right)) :: _ :: ( _, ( MlyValue.EXPR EXPR1, EXPR1left, _)) :: rest671)) => let val  result = MlyValue.EXPR ((*#line 51.36 "tiger.grm"*) Ast.plus  EXPR1 EXPR2 (*#line 290.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, EXPR1left, EXPR2right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.EXPR EXPR2, _, EXPR2right)) :: _ :: ( _, ( MlyValue.EXPR EXPR1, EXPR1left, _)) :: rest671)) => let val  result = MlyValue.EXPR ((*#line 52.29 "tiger.grm"*) Ast.minus EXPR1 EXPR2 (*#line 294.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, EXPR1left, EXPR2right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.EXPR EXPR2, _, EXPR2right)) :: _ :: ( _, ( MlyValue.EXPR EXPR1, EXPR1left, _)) :: rest671)) => let val  result = MlyValue.EXPR ((*#line 53.29 "tiger.grm"*) Ast.mul   EXPR1 EXPR2 (*#line 298.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, EXPR1left, EXPR2right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.EXPR EXPR2, _, EXPR2right)) :: _ :: ( _, ( MlyValue.EXPR EXPR1, EXPR1left, _)) :: rest671)) => let val  result = MlyValue.EXPR ((*#line 54.29 "tiger.grm"*) Ast.div   EXPR1 EXPR2 (*#line 302.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, EXPR1left, EXPR2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.EXPR EXPR2, _, EXPR2right)) :: _ :: ( _, ( MlyValue.EXPR EXPR1, EXPR1left, _)) :: rest671)) => let val  result = MlyValue.EQ ((*#line 56.24 "tiger.grm"*)Ast.EQUAL EXPR1 EXPR2(*#line 306.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXPR1left, EXPR2right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.PROGRAM x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : Expr_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun CONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.CONST i,p1,p2))
fun VAR (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.VAR i,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.VOID,p1,p2))
fun MUL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.VOID,p1,p2))
fun DIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.VOID,p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.VOID,p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.VOID,p1,p2))
fun LET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(ParserData.MlyValue.VOID,p1,p2))
fun IN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(ParserData.MlyValue.VOID,p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(ParserData.MlyValue.VOID,p1,p2))
fun ASSIGNMENT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(ParserData.MlyValue.VOID,p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(ParserData.MlyValue.VOID,p1,p2))
fun TO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(ParserData.MlyValue.VOID,p1,p2))
fun EQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(ParserData.MlyValue.VOID,p1,p2))
end
end
