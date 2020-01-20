structure tigh = struct
val interactive = tiglex.makeLexer (fn _ => TextIO.inputN (TextIO.stdIn,1))


fun lexfile file = let val strm = TextIO.openIn file
		   in tiglex.makeLexer (fn n => TextIO.inputN(strm,n))
		   end
fun whitespace (1,Tab) = "\t"
	| whitespace (n,Tab) = "\t"^whitespace(n-1,Tab)
	| whitespace (1,Space) = " "
	| whitespace (n,Space) = " "^whitespace(n-1,Space)


fun toktostr token = case token of
		  (Const x) => Int.toString(x)
		| (String x) => x
		| (W (x,n)) => whitespace(n,x)
		| (Quotes x) => x
		| (Newline) => "\n"
		| (END) => ""
		| (Comments x) => x
		| (K Array) => "array"
		| (K If) => "if"
		| (K Then) => "then"
		| (K Else) => "else"
		| (K While) => "while"
		| (K For) => "for"
		| (K Let) => "let"
		| (K To) => "to"
		| (K Do) => "do"
		| (K In) => "in"
		| (K End) => "end"
		| (K Of) => "of"
		| (K Break) => "break"
		| (K Nil) => "nil"
		| (K Function) => "function"
		| (K Var) => "var"
		| (K Type) => "type"
		| (K Import) => "import"
		| (K Primitive) => "primitive"
		| (O Class) => "class"
		| (O Extends) => "extends"
		| (O Method) => "method"
		| (O New) => "new"
		| (S Comma) => ","
		| (S Colon) => ":"
		| (S Semicolon) => ";"
 		| (S LeftB) => "("
		| (S RightB) => ")"
		| (S LeftSB) => "["
		| (S RightSB) => "]"
		| (S LeftCB) => "{"
		| (S RightCB) => "}"
		| (S Dot) => "."
		| (S Plus) => "+"
		| (S Minus) => "-"
		| (S Mul) => "*"
		| (S Div) => "/"
		| (S Equal) => "="
		| (S LTGT) => "<>"
		| (S LT) => "<"
		| (S LTEqual) => "<="
		| (S GT) => ">"
		| (S GTEqual) => ">="
		| (S AND) => "&"
		| (S OR) => "|"
		| (S ColonEqual) => ":="

fun prettyprint token = case token of
		 (Const x) => print("\027[30m"^(toktostr token))
		|(String x) => print("\027[96m"^(toktostr token))
		|(W _) => print(toktostr token)
		|(Quotes x) => print("\027[94m"^(toktostr token))
		|(Newline) => print(toktostr token)
		|(END) => print("\027[0m"^toktostr token)
		|(Comments x) => print("\027[32m"^(toktostr token))
		|(K _) => print("\027[34m"^(toktostr token))
		|(O _) => print("\027[37m"^(toktostr token))
		|(S _) => print("\027[35m"^(toktostr token))

			

fun runWithLexer lexer = let fun loop stack = case lexer () of
						  END      => prettyprint(END)
					       |  token    => loop (prettyprint token)
			 in loop ()
			 end
val _ =  ( case CommandLine.arguments() of
	       [] => runWithLexer interactive
	    |  xs => (List.map (runWithLexer o lexfile) xs; ())
	 )
end

