structure Ast = struct

datatype Exp   =  Nil
		| Const		of int
		| Var		of string
		| Quote		of string
		| ArrayCreate	of Exp * Exp * Exp
		| RecordCreate	of Exp * Exp
		| Help11	of Exp * Exp
		| Help12	of Exp * Exp * Exp
		| New		of Exp
		| FunctionCall	of Exp * Exp list
		| MethodCall	of Exp * Exp * Exp list
		| Lvalue	of Exp * Exp
		| Monominus	of Exp
                | Op         	of Exp * BinOp * Exp
		| OpList	of Exp list
		| Assignment 	of Exp * Exp
		| If 	     	of Exp * Exp
		| Else       	of Exp * Exp * Exp
		| While      	of Exp * Exp
		| For 	     	of Exp * Exp * Exp * Exp
		| Break
		| Let        	of Exp list * Exp list
		| TyDec		of Exp * Exp
		| ClassAlt1	of Exp * Exp list
		| ClassAlt2	of Exp * Exp * Exp list
		| VarDec	of Exp * Exp
		| FunDec1	of Exp * Exp * Exp
		| FunDec2	of Exp * Exp * Exp * Exp
		| PrimDec1	of Exp * Exp
		| PrimDec2	of Exp * Exp * Exp
		| Import	of Exp
		| AttrDec	of Exp * Exp * Exp
		| Method	of Exp
		| ArrayDef	of Exp
		| ClassCan	of Exp
		| TyField1	of Exp * Exp
		| TyField2	of Exp * Exp * Exp

     and BinOp  = Plus
                | Minus
                | Mul
		| Div
		| Equal
		| Ltgt
		| Gt
		| Lt
		| Gtequal
		| Ltequal
		| And
		| Or

fun ARRAYCREATE		a b c	= ArrayCreate (a,b,c)
fun RECORDCREATE	a b	= RecordCreate (a,b)
fun HELP11		a b	= Help11 (a,b)
fun HELP12		a b c	= Help12 (a,b,c)

fun FUNCTIONCALL  	a b	= FunctionCall (a,b)
fun METHODCALL		a b c	= MethodCall (a,b,c)
fun LVALUE		a b	= Lvalue (a,b)
fun ASSIGNMENT  	a b     = Assignment (a, b)

fun IF 		a b     = If (a, b)
fun ELSE 	a b c   = Else (a,b,c)
fun WHILE 	a b     = While (a, b)
fun FOR 	a b c d = For (a, b, c, d)
fun LET		a b	= Let (a,b)

fun PLUS    a b = Op (a, Plus, b)
fun MINUS   a b = Op (a, Minus, b)
fun MUL     a b = Op (a, Mul, b)
fun DIV     a b = Op (a, Div, b)
fun EQUAL   a b = Op (a, Equal, b)
fun LTGT    a b = Op (a, Ltgt, b)
fun GT      a b = Op (a, Gt, b)
fun LT      a b = Op (a, Lt, b)
fun GTEQUAL a b = Op (a, Gtequal, b)
fun LTEQUAL a b = Op (a, Ltequal, b)
fun AND     a b = Op (a, And, b)
fun OR      a b = Op (a, Or, b)
		
fun TYDEC	a b	= TyDec (a,b)
fun CLASSALT1	a b	= ClassAlt1 (a,b)
fun CLASSALT2	a b c	= ClassAlt2 (a,b,c)
fun VARDEC	a b	= VarDec (a,b)
fun FUNDEC1	a b c	= FunDec1 (a,b,c)
fun FUNDEC2	a b c d	= FunDec2 (a,b,c,d)
fun ATTRDEC	a b c	= AttrDec (a,b,c)
fun PRIMDEC1	a b	= PrimDec1 (a,b)
fun PRIMDEC2	a b c	= PrimDec2 (a,b,c)

fun TYFIELD1	a b	= TyField1 (a,b)
fun TYFIELD2	a b c	= TyField2 (a,b,c)

end
