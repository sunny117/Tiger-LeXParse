structure Indent = struct

fun P 0     = " "
  | P s = " " ^ (P (s-1))

fun E s (Ast.Nil)		= "nil"
  | E s (Ast.Const a)		= Int.toString a
  | E s (Ast.Quote a)		= a
  
  | E s (Ast.ArrayCreate (a,b,c))	= (P s)^(Id s a)^"["^(E 0 b)^"] "^"of "^(E 0 c)^"\n"
  | E s (Ast.RecordCreate (a,b))	= (P s)^(Id s a)^"{"^(H1 s b)^"}"
  | E s (Ast.New a)			= (P s)^"new"^(Id s a)^"\n"
  | E s (Ast.I1 (Ast.Var a))		= (P s)^a
  | E s (Ast.L (Ast.Lvalue1 (a,b)))	= (P s)^(Id s a)^"."^(Id 0 b)
  | E s (Ast.L (Ast.Lvalue2 (a,b)))	= (P s)^(Id s a)^"["^(E 0 b)^"]\n"
  | E s (Ast.L (Ast.Lvalue3 (a,b)))	= (P s)^(LV s a)^"."^(Id 0 b)
  | E s (Ast.L (Ast.Lvalue4 (a,b)))	= (P s)^(LV s a)^"["^(E 0 b)^"]\n"
  | E s (Ast.FunctionCall (a,b))	= (P s)^(Id s a)^"("^(H2 0 b)^")"
  | E s (Ast.MethodCall1 (a,b,c))	= (P s)^(Id s a)^"."^(Id 0 b)^"("^(H2 0 c)^")"
  | E s (Ast.MethodCall2 (a,b,c))	= (P s)^(LV s a)^"."^(Id 0 b)^"("^(H2 0 c)^")"
  | E s (Ast.Monominus a)		= (P s)^"-"^(E 0 a)
  | E s (Ast.Op (a,Ast.Plus,b))		= (P s)^(E s a) ^ " + " ^ (E s b)
  | E s (Ast.Op (a,Ast.Minus,b))	= (P s)^(E s a) ^ " - " ^ (E s b)
  | E s (Ast.Op (a,Ast.Mul,b))		= (P s)^(E s a) ^ " * " ^ (E s b)
  | E s (Ast.Op (a,Ast.Div,b))		= (P s)^(E s a) ^ " / " ^ (E s b)
  | E s (Ast.Op (a,Ast.Equal,b))	= (P s)^(E s a) ^ " = " ^ (E s b)
  | E s (Ast.Op (a,Ast.Ltgt,b))		= (P s)^(E s a) ^ " <> " ^ (E s b)
  | E s (Ast.Op (a,Ast.Gt,b))		= (P s)^(E s a) ^ " > " ^ (E s b)
  | E s (Ast.Op (a,Ast.Lt,b))		= (P s)^(E s a) ^ " < " ^ (E s b)
  | E s (Ast.Op (a,Ast.Gtequal,b))	= (P s)^(E s a) ^ " >= " ^ (E s b)
  | E s (Ast.Op (a,Ast.Ltequal,b))	= (P s)^(E s a) ^ " <= " ^ (E s b)
  | E s (Ast.Op (a,Ast.And,b))		= (P s)^(E s a) ^ " & " ^ (E s b)
  | E s (Ast.Op (a,Ast.Or,b))		= (P s)^(E s a) ^ " | " ^ (E s b)
  | E s (Ast.OpList a)			= (P 0)^"(\n"^(ES (s+4) a)^"\n"^(P s)^")\n"
  | E s (Ast.Assignment1 (a,b)) 	= (P s)^(Id s a) ^ " := " ^ (E 0 b)^"\n"
  | E s (Ast.Assignment2 (a,b)) 	= (P s)^(LV s a) ^ " := " ^ (E 0 b)^"\n"
  | E s (Ast.If (a,b))			= (P s)^"if " ^ (E 0 a) ^ " then\n " ^ (E (s+2) b)
  | E s (Ast.Else (a,b,c))		= (P s)^"if " ^ (E 0 a) ^ " then\n " ^ (E (s+2) b)^"else"^ (E (s+2) c)
  | E s (Ast.While (a,b))		= (P s)^"while " ^ (E 0 a) ^ " do\n" ^ (E (s+2) b)
  | E s (Ast.For (a,b,c,d))    		= (P s)^"for " ^ (Id 0 a) ^ " := " ^ (E 0 b) ^ " to " ^ (E s c) ^ " do\n" ^ (E (s+2) d)
  | E s (Ast.Break )			= (P s)^"break\n"
  | E s (Ast.Let (a,b))			= (P s)^"let\n"^(DS (s+4) a)^(P s)^"in\n"^(ES (s+4) b) ^(P s)^"end\n"
  
and Id s (Ast.Var a) = (P s)^a

and H1 s (Ast.Help11 (a,b))	= (P s)^(Id s a)^"="^(E s b)
  | H1 s (Ast.Help12 (a,b,c))	= (P s)^(Id s a)^"="^(E s b)^","^(H1 s c)


and H2 s [] = ""
 | H2 s (a :: []) = (E s a)
 | H2 s (a :: xs) = (E s a)^","^(H2 s xs) 


and LV s (Ast.Lvalue1 (a,b))	= (P s)^(Id s a)^"."^(Id s b)
  | LV s (Ast.Lvalue2 (a,b))	= (P s)^(Id s a)^"["^(E s b)^"]"
  | LV s (Ast.Lvalue3 (a,b))	= (P s)^(LV s a)^"."^(Id s b)^""
  | LV s (Ast.Lvalue4 (a,b))	= (P s)^(LV s a)^"["^(E s b)^"]"

and ES s [] = ""
 | ES s (a :: []) = (E s a)
 | ES s (a :: xs) = (E s a)^";\n"^(ES s xs) 


and DS s [] = ""
 | DS s (a :: []) = (D s a)
 | DS s (a :: xs) = (D s a)^(DS s xs)

and D s (Ast.TyDec (a,b))	= (P s)^"type "^(Id 0 a)^"="^(TY 0 b)
  | D s (Ast.ClassAlt1 (a,b))	= (P s)^"class "^(Id 0 a)^"{\n"^(CFS (s+4) b)^"\n"^(P s)^"}\n"
  | D s (Ast.ClassAlt2 (a,b,c))	= (P s)^"class "^(Id 0 a)^" extends "^(Id 0 b)^"{\n"^(CFS (s+4) c)^"\n"^(P s)^"}\n"
  | D s (Ast.VarDec1 (a,b))	= (P s)^"var "^(Id 0 a)^" := "^(E 0 b)^"\n"
  | D s (Ast.VarDec2 (a,b,c))	= (P s)^"var "^(Id 0 a)^" : "^(Id 0 b)^" := "^(E 0 c)^"\n"
  | D s (Ast.FunDec1 (a,b,c))	= (P s)^"function "^(Id 0 a)^"("^(TYF 0 b)^") "^"= "^(E 0 c)^"\n"
  | D s (Ast.FunDec2 (a,b,c,d))	= (P s)^"function "^(Id 0 a)^"("^(TYF 0 b)^") "^": "^(Id 0 c)^" = "^(E s d)^"\n"
  | D s (Ast.PrimDec1 (a,b))	= (P s)^"primitive "^(Id 0 a)^"("^(TYF 0 b)^")\n"
  | D s (Ast.PrimDec2 (a,b,c))	= (P s)^"primitive "^(Id 0 a)^"("^(TYF 0 b)^") "^": "^(Id 0 c)^"\n"
  | D s (Ast.Import a)		= (P s)^"import "^"\""^(E 0 a)^"\"\n"
  
and CFS s [] = ""
 | CFS s (a :: []) = (CF s a)
 | CFS s (a :: xs) = (CF s a)^(CFS s xs)

and CF s (Ast.AttrDec1 (a,b,c))	= (P s)^"var "^(Id 0 a)^" : "^(Id 0 b)^" := "^(E 0 c)
  | CF s (Ast.Method1 (a,b,c,d))= (P s)^"method "^(Id 0 a)^" ( "^(TYF 0 b)^") : "^(Id 0 c)^" = "^(E s d)
  | CF s (Ast.AttrDec2 (a,b))	= (P s)^"var "^(Id 0 a)^" := "^(E 0 b)^"\n"
  | CF s (Ast.Method2 (a,b,c))	= (P s)^"method "^(Id 0 a)^" ( "^(TYF 0 b)^") "^" = "^(E 0 c)
  
and TY s (Ast.I2 (Ast.Var a))	= (P s)^a
  | TY s (Ast.Ty1 (a,b))	= (P s)^(Id s a)^":"^(Id s b)
  | TY s (Ast.Ty2 (a,b,c))	= (P s)^(Id s a)^":"^(Id s b)^","^(TYF s c)
  | TY s (Ast.ArrayDef a)	= (P s)^"array of "^(Id s a)
  | TY s (Ast.ClassCan1 a)	= (P s)^"class {"^(CFS s a)^"}"
  | TY s (Ast.ClassCan2 (a,b))	= (P s)^"class extends "^(Id s a)^"{"^(CFS s b)^"}"

and TYF s (Ast.Empty	)	= (P s)^""
  | TYF s (Ast.TyField1 (a,b))	= (P s)^(Id s a)^":"^(Id s b)
  | TYF s (Ast.TyField2 (a,b,c))= (P s)^(Id s a)^":"^(Id s b)^","^(TYF s c)


and Pr s (Ast.Expr a)	= (E s a)
  | Pr s (Ast.Decr a) 	= (DS s a)

end 
