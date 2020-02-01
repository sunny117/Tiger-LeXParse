structure Ast = struct

datatype Expr   = Const of int
		| Var of string
		| Assignment of Expr * Expr
		| For of Expr * Expr * Expr * Expr
		| While of Expr * Expr
		| If of Expr * Expr
		| Equal of Expr * Expr
		| Else of Expr
		| Break
		| Let of Expr list * Expr list
                | Op    of Expr * BinOp * Expr

     and BinOp  = Plus
                | Minus
                | Mul
		| Div


fun ASSIGNMENT  a b     = Assignment (a, b)
fun FOR 	a b c d = For (a, b, c, d)
fun WHILE 	a b     = While (a, b)
fun IF 		a b     = If (a, b)
fun EQUAL	a b	= Equal (a, b)
fun ELSE 	a       = Else a
fun LET		a b	= Let (a,b)

fun plus  a b = Op (a, Plus, b)
fun minus a b = Op (a, Minus, b)
fun mul   a b = Op (a, Mul, b)
fun div   a b = Op (a, Div, b)

end
