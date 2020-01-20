datatype keywords = Array
		| If
		| Then
		| Else
		| While
		| For
		| To
		| Do
		| Let
		| In
		| End
		| Of
		| Break
		| Nil
		| Function
		| Var
		| Type
		| Import
		| Primitive

datatype objectKeywords = Class
			| Extends
			| Method
			| New

datatype symbols = Comma
		| Colon
		| Semicolon
		| LeftB
		| RightB
		| LeftSB
		| RightSB
		| LeftCB
		| RightCB
		| Dot
		| Plus
		| Minus
		| Mul
		| Div
		| Equal
		| LTGT
		| LT
		| LTEqual
		| GT
		| GTEqual
		| AND
		| OR
		| ColonEqual

datatype whiteCharacters = Space
			| Tab

datatype Token = Newline
		| END
		| K of keywords
		| O of objectKeywords
		| S of symbols
		| W of whiteCharacters*int
		| Comments of string
		| Quotes of string
		| String of string
		| Const of int


		
