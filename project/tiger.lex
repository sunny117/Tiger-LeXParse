type lexresult = Token

fun eof () = END;

fun charsToInt m (x :: xs) = charsToInt (10 * m + ord x - ord #"0") xs
  | charsToInt m []        = m

fun toSigned (#"-" :: xs) = ~ (charsToInt 0 xs)
  | toSigned (#"~" :: xs) = ~ (charsToInt 0 xs)
  | toSigned (#"+" :: xs) =   charsToInt 0 xs
  | toSigned xs           =   charsToInt 0 xs

val toInt  = toSigned o String.explode

%%

%structure tiglex
digit = [0-9];
str = [a-zA-Z];

%%

[+-~]?{digit}+			=> (Const (toInt yytext));
[\t]+				=> (W (Tab, size yytext));
[\ ]+				=> (W (Space, size yytext));

"\"".*"\""			=> (Quotes yytext);
[\n]				=> (Newline);
"/*"([^*]|\*+[^*/])*\*+"/"	=> (Comments yytext);

"array"			=> (K Array);
"if"			=> (K If);
"then"			=> (K Then);
"else"			=> (K Else);
"while"			=> (K While);
"for"			=> (K For);
"to"			=> (K To);
"do"			=> (K Do);
"let"			=> (K Let);
"in"			=> (K In);
"end"			=> (K End);
"of"			=> (K Of);
"break"			=> (K Break);
"nil"			=> (K Nil);
"function"		=> (K Function);
"var"			=> (K Var);
"type"			=> (K Type);
"import"		=> (K Import);
"primitive"		=> (K Primitive);

"Class"			=> (O Class);
"Extends"		=> (O Extends);
"Method"		=> (O Method);
"New"			=> (O New);

","			=> (S Comma);
":"			=> (S Colon);
";"			=> (S Semicolon);
"("			=> (S LeftB);
")"			=> (S RightB);
"["			=> (S LeftSB);
"]"			=> (S RightSB);
"{"			=> (S LeftCB);
"}"			=> (S RightCB);
"."			=> (S Dot);
"+"			=> (S Plus);
"-"			=> (S Minus);
"*"			=> (S Mul);
"/"			=> (S Div);
"="			=> (S Equal);
"<>"			=> (S LTGT);
"<"			=> (S LT);
"<="			=> (S LTEqual);
">"			=> (S GT);
">="			=> (S GTEqual);
"&"			=> (S AND);
"|"			=> (S OR);
":="			=> (S ColonEqual);
{str}+			=> (String yytext);

