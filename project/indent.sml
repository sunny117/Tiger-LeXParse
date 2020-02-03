structure Indent = struct

fun printspace 0     = " "
  | printspace space = " " ^ (printspace (space-1))

fun indent space (Ast.For (a,b,c,d))    = (printspace space) ^ "for" ^ (indent space a) ^ ":=" ^ (indent space b) ^ " to " ^ (indent space c) ^ " do\n" ^ (indent (space+2) d)

  | indent space (Ast.While (a,b))	= (printspace space) ^ "while " ^ (indent space a) ^ " do\n" ^ (indent (space+2) b)
  | indent space (Ast.If (a,b))		= (printspace space) ^ "if " ^ (indent space a) ^ " then " ^ (indent (space+2) b)
  | indent space (Ast.Equal (a,b))	= (indent space a) ^ "=" ^ (indent space b)
  | indent space (Ast.Else a)		= (printspace space) ^ "else\n" ^ (indent (space+2) a)

  | indent space (Ast.Let (a,b))	= (printspace space) ^ "let\n" ^ (indentlist (space+2) a) ^ (printspace space) ^ "in\n" ^ (indentlist (space+2) b) ^ "\n" ^ (printspace space) ^ "end"
  | indent space (Ast.Break )		= (printspace space) ^ "break\n"
  | indent space (Ast.Assignment (a,b)) = (printspace space) ^ (indent space a) ^ ":=" ^ (indent space b) ^ ";"
  | indent space (Ast.Var a)		= a
  | indent space (Ast.Op (a,Ast.Plus,b))	= (indent space a) ^ "+" ^ (indent space b)
  | indent space (Ast.Op (a,Ast.Minus,b))	= (indent space a) ^ "-" ^ (indent space b)
  | indent space (Ast.Op (a,Ast.Mul,b))	= (indent space a) ^ "*" ^ (indent space b)
  | indent space (Ast.Op (a,Ast.Div,b))	= (indent space a) ^ "/" ^ (indent space b)
  | indent space (Ast.Const a)		= Int.toString a
  


and indentlist space [] 	= ""
  | indentlist space (x::xs) 	= (indent space x ^ "\n" ^ indentlist space xs)

end
