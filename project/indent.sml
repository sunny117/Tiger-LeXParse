structure Indent = struct

fun P 0     = " "
  | P s = " " ^ (P (s-1))

fun E s (Ast.Nil)		= (P s)^"nil\n"
  | E s (Ast.Const a)		= Int.toString a
  | E s (Ast.Quote a)		= a
  
  | E s (Ast.ArrayCreate (a,b,c))	= (P s)^(Id s a)^"["^(E s b)^"]"^"of"^(E s c)
  | E s (Ast.RecordCreate (a,b))	= (P s)^(Id s a)^"{"^(H1 s b)^"}\n"
  | E s (Ast.New a)			= (P s)^"new"^(Id s a)
  | E s (Ast.I1 (Ast.Var a))		= (P s)^a
  | E s (Ast.L (Ast.Lvalue1 (a,b)))	= (P s)^(Id s a)^"."^(Id s b)
  | E s (Ast.L (Ast.Lvalue2 (a,b)))	= (P s)^(Id s a)^"["^(E s b)^"]\n"
  | E s (Ast.L (Ast.Lvalue3 (a,b)))	= (P s)^(LV s a)^"."^(Id s b)
  | E s (Ast.L (Ast.Lvalue4 (a,b)))	= (P s)^(LV s a)^"["^(E s b)^"]"
  | E s (Ast.FunctionCall (a,b))	= (P s)^(Id s a)^"("^(H2 s b)^")"
  | E s (Ast.MethodCall1 (a,b,c))	= (P s)^(Id s a)^"."^(Id s b)^"("^(H2 s c)^")"
  | E s (Ast.MethodCall2 (a,b,c))	= (P s)^(LV s a)^"."^(Id s b)^"("^(H2 s c)^")"
  | E s (Ast.Monominus a)		= "-"^(E s a)
  | E s (Ast.Op (a,Ast.Plus,b))		= (E s a) ^ "+" ^ (E s b)
  | E s (Ast.Op (a,Ast.Minus,b))	= (E s a) ^ "-" ^ (E s b)
  | E s (Ast.Op (a,Ast.Mul,b))		= (E s a) ^ "*" ^ (E s b)
  | E s (Ast.Op (a,Ast.Div,b))		= (E s a) ^ "/" ^ (E s b)
  | E s (Ast.Op (a,Ast.Equal,b))	= (E s a) ^ "=" ^ (E s b)
  | E s (Ast.Op (a,Ast.Ltgt,b))		= (E s a) ^ "<>" ^ (E s b)
  | E s (Ast.Op (a,Ast.Gt,b))		= (E s a) ^ ">" ^ (E s b)
  | E s (Ast.Op (a,Ast.Lt,b))		= (E s a) ^ "<" ^ (E s b)
  | E s (Ast.Op (a,Ast.Gtequal,b))	= (E s a) ^ ">=" ^ (E s b)
  | E s (Ast.Op (a,Ast.Ltequal,b))	= (E s a) ^ "<=" ^ (E s b)
  | E s (Ast.Op (a,Ast.And,b))		= (E s a) ^ "&" ^ (E s b)
  | E s (Ast.Op (a,Ast.Or,b))		= (E s a) ^ "|" ^ (E s b)
  | E s (Ast.OpList a)			= (P s)^"("^(ES s a)^")"
  | E s (Ast.Assignment1 (a,b)) 	= (P s) ^ (Id s a) ^ ":=" ^ (E s b)
  | E s (Ast.Assignment2 (a,b)) 	= (P s) ^ (LV s a) ^ ":=" ^ (E s b)
  | E s (Ast.If (a,b))			= (P s) ^ "if " ^ (E s a) ^ " then " ^ (E (s+2) b)^"\n"
  | E s (Ast.Else (a,b,c))		= (P s) ^ "if " ^ (E s a) ^ " then " ^ (E (s+2) b)^"else"^ (E (s+2) c)^"\n"
  | E s (Ast.While (a,b))		= (P s) ^ "while " ^ (E s a) ^ " do\n" ^ (E (s+2) b)^"\n"
  | E s (Ast.For (a,b,c,d))    		= (P s) ^ "for" ^ (Id s a) ^ " := " ^ (E s b) ^ " to " ^ (E s c) ^ " do\n" ^ (E (s+2) d)^"\n"
  | E s (Ast.Break )			= (P s) ^ "break\n"
  | E s (Ast.Let (a,b))			= (P s) ^ "let\n " ^ (DS s a)^(P s)^"in\n"^(ES (s+2) b) ^ (P s) ^ "\nend\n"
  
and Id s (Ast.Var a) = a

and H1 s (Ast.Help11 (a,b))	= (Id s a)^"="^(E s b)
  | H1 s (Ast.Help12 (a,b,c))	= (Id s a)^"="^(E s b)^","^(H1 s c)


and H2 s [] = ""
 | H2 s (a :: []) = (E s a)
 | H2 s (a :: xs) = (E s a)^","^(H2 s xs) 


and LV s (Ast.Lvalue1 (a,b))	= (Id s a)^"."^(Id s b)^"\n"
  | LV s (Ast.Lvalue2 (a,b))	= (Id s a)^"["^(E s b)^"]\n"
  | LV s (Ast.Lvalue3 (a,b))	= (LV s a)^"."^(Id s b)^"\n"
  | LV s (Ast.Lvalue4 (a,b))	= (LV s a)^"["^(E s b)^"]\n"

and ES s [] = ""
 | ES s (a :: []) = (E s a)
 | ES s (a :: xs) = (E s a)^";\n"^(ES s xs) 


and DS s [] = ""
 | DS s (a :: []) = (D s a)
 | DS s (a :: xs) = (D s a)^(DS s xs)

and D s (Ast.TyDec (a,b))	= "type "^(Id s a)^"="^(TY s b)^"\n"
  | D s (Ast.ClassAlt1 (a,b))	= "class "^(Id s a)^"{"^(CFS s b)^"}\n"
  | D s (Ast.ClassAlt2 (a,b,c))	= "class "^(Id s a)^"extends"^(Id s b)^"{"^(CFS s c)^"}\n"
  | D s (Ast.VarDec (a,b))	= "var "^(Id s a)^":="^(E s b)^"\n"
  | D s (Ast.FunDec1 (a,b,c))	= "function "^(Id s a)^"("^(TYF s b)^")"^"="^(E s c)^"\n"
  | D s (Ast.FunDec2 (a,b,c,d))	= "function "^(Id s a)^"("^(TYF s b)^")"^":"^(Id s c)^"="^(E s d)^"\n"
  | D s (Ast.PrimDec1 (a,b))	= "primitive "^(Id s a)^"("^(TYF s b)^")\n"
  | D s (Ast.PrimDec2 (a,b,c))	= "primitive "^(Id s a)^"("^(TYF s b)^")"^":"^(Id s c)^"\n"
  | D s (Ast.Import a)		= "import "^"\""^(E s a)^"\""^"\n"
  
and CFS s [] = ""
 | CFS s (a :: []) = (CF s a)
 | CFS s (a :: xs) = (CF s a)^(CFS s xs)

and CF s (Ast.AttrDec1 (a,b,c))	= (P s)^"var "^(Id s a)^":"^(Id s b)^":="^(E s c)^"\n"
  | CF s (Ast.Method1 (a,b,c,d))= (P s)^"method "^(Id s a)^" ( "^(TYF s b)^") :"^(Id s c)^"="^(E s d)^"\n"
  | CF s (Ast.AttrDec2 (a,b))	= (P s)^"var "^(Id s a)^":="^(E s b)^"\n"
  | CF s (Ast.Method2 (a,b,c))	= (P s)^"method "^(Id s a)^" ( "^(TYF s b)^") "^"="^(E s c)^"\n"
  
and TY s (Ast.I2 (Ast.Var a))		=  a
  | TY s (Ast.Ty1 (a,b))	= (Id s a)^":"^(Id s b)
  | TY s (Ast.Ty2 (a,b,c))	= (Id s a)^":"^(Id s b)^","^(TYF s c)
  | TY s (Ast.ArrayDef a)	= (P s)^"array of "^(Id s a)
  | TY s (Ast.ClassCan1 a)	= (P s)^"class {\n"^(CFS s a)^"}\n"
  | TY s (Ast.ClassCan2 (a,b))	= (P s)^"class extends "^(Id s a)^"{\n"^(CFS s b)^"}\n"

and TYF s (Ast.Empty	)	= ""
  | TYF s (Ast.TyField1 (a,b))	= (Id s a)^":"^(Id s b)
  | TYF s (Ast.TyField2 (a,b,c))= (Id s a)^":"^(Id s b)^","^(TYF s c)


and Pr s (Ast.Expr a)	= (E s a)
  | Pr s (Ast.Decr a) 	= (DS s a)

end
