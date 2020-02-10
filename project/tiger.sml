structure TIGER =
struct

structure EXPLrVals = EXPLrValsFun(structure Token = LrParser.Token)
structure EXPLex    = EXPLexFun(structure Tokens = EXPLrVals.Tokens)
structure EXPParser = Join( structure ParserData = EXPLrVals.ParserData
			     structure Lex        = EXPLex
			     structure LrParser   = LrParser
			   )

fun makeEXPLexer strm = EXPParser.makeLexer (fn n => TextIO.inputN(strm,n))
val makeFileLexer      = makeEXPLexer o TextIO.openIn

val thisLexer = case CommandLine.arguments() of
		    []  => makeEXPLexer TextIO.stdIn
		 |  [x] => makeFileLexer x
		 |  _   => (TextIO.output(TextIO.stdErr, "usage: ec file"); OS.Process.exit OS.Process.failure)



fun print_error (s,i:int,_) = TextIO.output(TextIO.stdErr,
					    "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")

val (program,_) = EXPParser.parse (0,thisLexer,print_error,())
val executable  = Indent.Pr 0 program
val _           = TextIO.output(TextIO.stdOut,executable)

end
