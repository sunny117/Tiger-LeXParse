
type lineNo            = int
type pos               = lineNo
val  lineRef : pos ref = ref 0

fun updateLine n      = lineRef := !(lineRef) + n

type svalue        = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult     = (svalue,pos) token


fun lineRange l r = "line " ^ l
				  
fun error (e,l,r) = TextIO.output(TextIO.stdErr, lineRange l r ^ ":" ^ e ^ "\n")

fun eof   ()      = Tokens.EOF (!lineRef,!lineRef)



fun charsToInt m (x :: xs) = charsToInt (10 * m + ord x - ord #"0") xs
  | charsToInt m []        = m

fun toSigned (#"-" :: xs) = ~ (charsToInt 0 xs)
  | toSigned (#"~" :: xs) = ~ (charsToInt 0 xs)
  | toSigned (#"+" :: xs) =   charsToInt 0 xs
  | toSigned xs           =   charsToInt 0 xs

val toInt        = toSigned o String.explode

val newlineCount = List.length o List.filter (fn x => x = #"\n") o String.explode

%%

%header (functor ExprLexFun(structure Tokens : Expr_TOKENS));
digit = [0-9];
str = [a-zA-Z];
ws = [\ \t];

%%

{digit}+			=> (Tokens.CONST(toInt yytext, !lineRef, !lineRef));

\n({ws}*\n)*			=> (lex());
{ws}+				=> (lex());

"if"			=> (Tokens.IF(!lineRef,!lineRef));
"then"			=> (Tokens.THEN(!lineRef,!lineRef));
"else"			=> (Tokens.ELSE(!lineRef,!lineRef));
"while"			=> (Tokens.WHILE(!lineRef,!lineRef));
"for"			=> (Tokens.FOR(!lineRef,!lineRef));
"to"			=> (Tokens.TO(!lineRef,!lineRef));
"do"			=> (Tokens.DO(!lineRef,!lineRef));
"let"			=> (Tokens.LET(!lineRef,!lineRef));
"in"			=> (Tokens.IN(!lineRef,!lineRef));
"end"			=> (Tokens.END(!lineRef,!lineRef));
"break"			=> (Tokens.BREAK(!lineRef,!lineRef));

":="			=> (Tokens.ASSIGNMENT(!lineRef,!lineRef));
";"			=> (Tokens.SEMICOLON(!lineRef,!lineRef));
"+"			=> (Tokens.PLUS(!lineRef,!lineRef));
"-"			=> (Tokens.MINUS(!lineRef,!lineRef));
"*"			=> (Tokens.MUL(!lineRef,!lineRef));
"/"			=> (Tokens.DIV(!lineRef,!lineRef));
"="			=> (Tokens.EQUAL(!lineRef,!lineRef));

{str}+			=> (Tokens.VAR(yytext,!lineRef,!lineRef));

