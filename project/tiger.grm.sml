functor EXPLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : EXP_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(*#line 1.2 "tiger.grm"*)

(*#line 13.1 "tiger.grm.sml"*)
end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\118\000\020\000\117\000\048\000\116\000\000\000\
\\001\000\002\000\024\000\005\000\023\000\006\000\022\000\009\000\021\000\
\\013\000\020\000\014\000\019\000\023\000\012\000\027\000\011\000\
\\035\000\010\000\048\000\009\000\050\000\008\000\051\000\007\000\000\000\
\\001\000\003\000\190\000\004\000\190\000\007\000\190\000\008\000\190\000\
\\010\000\190\000\011\000\190\000\015\000\190\000\016\000\190\000\
\\017\000\190\000\018\000\190\000\019\000\190\000\020\000\190\000\
\\022\000\190\000\024\000\190\000\026\000\190\000\028\000\190\000\
\\030\000\190\000\032\000\190\000\034\000\040\000\035\000\039\000\
\\036\000\038\000\037\000\037\000\044\000\190\000\045\000\190\000\
\\047\000\190\000\000\000\
\\001\000\003\000\191\000\004\000\191\000\007\000\191\000\008\000\191\000\
\\010\000\191\000\011\000\191\000\015\000\191\000\016\000\191\000\
\\017\000\191\000\018\000\191\000\019\000\191\000\020\000\191\000\
\\022\000\191\000\024\000\191\000\026\000\191\000\028\000\191\000\
\\030\000\191\000\032\000\191\000\034\000\040\000\035\000\039\000\
\\036\000\038\000\037\000\037\000\044\000\191\000\045\000\191\000\
\\047\000\191\000\000\000\
\\001\000\003\000\192\000\004\000\192\000\007\000\192\000\008\000\192\000\
\\010\000\192\000\011\000\192\000\015\000\192\000\016\000\192\000\
\\017\000\192\000\018\000\192\000\019\000\192\000\020\000\192\000\
\\022\000\192\000\024\000\192\000\026\000\192\000\028\000\192\000\
\\030\000\192\000\032\000\192\000\034\000\040\000\035\000\039\000\
\\036\000\038\000\037\000\037\000\044\000\192\000\045\000\192\000\
\\047\000\192\000\000\000\
\\001\000\003\000\193\000\004\000\193\000\007\000\193\000\008\000\193\000\
\\010\000\193\000\011\000\193\000\015\000\193\000\016\000\193\000\
\\017\000\193\000\018\000\193\000\019\000\193\000\020\000\193\000\
\\022\000\193\000\024\000\193\000\026\000\193\000\028\000\193\000\
\\030\000\193\000\032\000\193\000\034\000\040\000\035\000\039\000\
\\036\000\038\000\037\000\037\000\044\000\193\000\045\000\193\000\
\\047\000\193\000\000\000\
\\001\000\003\000\194\000\004\000\194\000\007\000\194\000\008\000\194\000\
\\010\000\194\000\011\000\194\000\015\000\194\000\016\000\194\000\
\\017\000\194\000\018\000\194\000\019\000\194\000\020\000\194\000\
\\022\000\194\000\024\000\194\000\026\000\194\000\028\000\194\000\
\\030\000\194\000\032\000\194\000\034\000\040\000\035\000\039\000\
\\036\000\038\000\037\000\037\000\044\000\194\000\045\000\194\000\
\\047\000\194\000\000\000\
\\001\000\003\000\195\000\004\000\195\000\007\000\195\000\008\000\195\000\
\\010\000\195\000\011\000\195\000\015\000\195\000\016\000\195\000\
\\017\000\195\000\018\000\195\000\019\000\195\000\020\000\195\000\
\\022\000\195\000\024\000\195\000\026\000\195\000\028\000\195\000\
\\030\000\195\000\032\000\195\000\034\000\040\000\035\000\039\000\
\\036\000\038\000\037\000\037\000\044\000\195\000\045\000\195\000\
\\047\000\195\000\000\000\
\\001\000\003\000\096\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\001\000\007\000\141\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\001\000\008\000\095\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\001\000\008\000\164\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\001\000\010\000\093\000\000\000\
\\001\000\011\000\140\000\000\000\
\\001\000\012\000\138\000\000\000\
\\001\000\021\000\087\000\031\000\086\000\000\000\
\\001\000\021\000\137\000\000\000\
\\001\000\025\000\136\000\000\000\
\\001\000\025\000\147\000\000\000\
\\001\000\025\000\154\000\038\000\153\000\000\000\
\\001\000\027\000\088\000\000\000\
\\001\000\027\000\092\000\000\000\
\\001\000\028\000\084\000\000\000\
\\001\000\028\000\103\000\000\000\
\\001\000\028\000\135\000\000\000\
\\001\000\028\000\139\000\000\000\
\\001\000\028\000\143\000\000\000\
\\001\000\028\000\144\000\000\000\
\\001\000\030\000\098\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\001\000\030\000\102\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\001\000\031\000\134\000\000\000\
\\001\000\032\000\100\000\000\000\
\\001\000\032\000\131\000\000\000\
\\001\000\032\000\159\000\000\000\
\\001\000\038\000\090\000\000\000\
\\001\000\038\000\101\000\000\000\
\\001\000\038\000\167\000\000\000\
\\001\000\046\000\091\000\000\000\
\\001\000\046\000\094\000\000\000\
\\001\000\046\000\165\000\000\000\
\\001\000\047\000\000\000\000\000\
\\001\000\048\000\050\000\000\000\
\\001\000\048\000\051\000\000\000\
\\001\000\048\000\052\000\000\000\
\\001\000\048\000\054\000\000\000\
\\001\000\048\000\055\000\000\000\
\\001\000\048\000\056\000\000\000\
\\001\000\048\000\058\000\000\000\
\\001\000\048\000\062\000\000\000\
\\001\000\048\000\078\000\000\000\
\\001\000\048\000\080\000\000\000\
\\001\000\048\000\110\000\000\000\
\\001\000\048\000\112\000\000\000\
\\001\000\048\000\132\000\000\000\
\\001\000\048\000\133\000\000\000\
\\001\000\048\000\150\000\000\000\
\\001\000\048\000\151\000\000\000\
\\001\000\048\000\152\000\000\000\
\\001\000\048\000\158\000\000\000\
\\001\000\048\000\160\000\000\000\
\\001\000\048\000\163\000\000\000\
\\001\000\049\000\041\000\000\000\
\\001\000\049\000\089\000\000\000\
\\001\000\051\000\053\000\000\000\
\\001\000\051\000\076\000\000\000\
\\001\000\051\000\113\000\000\000\
\\172\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\173\000\000\000\
\\174\000\000\000\
\\175\000\000\000\
\\176\000\000\000\
\\177\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\178\000\000\000\
\\179\000\000\000\
\\180\000\027\000\046\000\029\000\045\000\031\000\044\000\033\000\043\000\
\\046\000\042\000\000\000\
\\181\000\029\000\028\000\033\000\027\000\046\000\026\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\000\000\
\\185\000\036\000\038\000\037\000\037\000\000\000\
\\186\000\036\000\038\000\037\000\037\000\000\000\
\\187\000\036\000\038\000\037\000\037\000\000\000\
\\188\000\000\000\
\\189\000\000\000\
\\196\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\000\000\
\\197\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\000\000\
\\198\000\000\000\
\\199\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\200\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\201\000\004\000\142\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\202\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\203\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\204\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\205\000\000\000\
\\206\000\000\000\
\\207\000\024\000\145\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\208\000\000\000\
\\209\000\024\000\104\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\210\000\000\000\
\\211\000\027\000\099\000\000\000\
\\212\000\012\000\128\000\000\000\
\\213\000\027\000\097\000\000\000\
\\214\000\000\000\
\\215\000\002\000\024\000\005\000\023\000\006\000\022\000\009\000\021\000\
\\013\000\020\000\014\000\019\000\023\000\012\000\027\000\011\000\
\\035\000\010\000\048\000\009\000\050\000\008\000\051\000\007\000\000\000\
\\216\000\026\000\085\000\034\000\040\000\035\000\039\000\036\000\038\000\
\\037\000\037\000\038\000\036\000\039\000\035\000\040\000\034\000\
\\041\000\033\000\042\000\032\000\043\000\031\000\044\000\030\000\
\\045\000\029\000\000\000\
\\217\000\000\000\
\\218\000\002\000\024\000\005\000\023\000\006\000\022\000\009\000\021\000\
\\013\000\020\000\014\000\019\000\015\000\018\000\016\000\017\000\
\\017\000\016\000\018\000\015\000\019\000\014\000\020\000\013\000\
\\023\000\012\000\027\000\011\000\035\000\010\000\048\000\009\000\
\\050\000\008\000\051\000\007\000\000\000\
\\218\000\015\000\018\000\016\000\017\000\017\000\016\000\018\000\015\000\
\\019\000\014\000\020\000\013\000\000\000\
\\219\000\000\000\
\\220\000\000\000\
\\221\000\000\000\
\\222\000\000\000\
\\223\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\224\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\225\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\226\000\025\000\149\000\000\000\
\\227\000\000\000\
\\228\000\000\000\
\\229\000\016\000\109\000\022\000\108\000\000\000\
\\230\000\000\000\
\\231\000\034\000\040\000\035\000\039\000\036\000\038\000\037\000\037\000\
\\038\000\036\000\039\000\035\000\040\000\034\000\041\000\033\000\
\\042\000\032\000\043\000\031\000\044\000\030\000\045\000\029\000\000\000\
\\232\000\000\000\
\\233\000\025\000\136\000\000\000\
\\234\000\000\000\
\\235\000\000\000\
\\236\000\000\000\
\\237\000\024\000\161\000\000\000\
\\238\000\000\000\
\"
val actionRowNumbers =
"\106\000\107\000\067\000\075\000\
\\066\000\061\000\069\000\074\000\
\\001\000\103\000\041\000\042\000\
\\043\000\063\000\044\000\045\000\
\\046\000\068\000\093\000\107\000\
\\047\000\001\000\001\000\108\000\
\\001\000\048\000\001\000\001\000\
\\001\000\001\000\001\000\001\000\
\\001\000\001\000\001\000\001\000\
\\001\000\001\000\001\000\064\000\
\\001\000\049\000\050\000\001\000\
\\001\000\079\000\022\000\104\000\
\\073\000\015\000\020\000\062\000\
\\034\000\037\000\021\000\012\000\
\\038\000\010\000\008\000\088\000\
\\101\000\028\000\085\000\084\000\
\\006\000\004\000\007\000\005\000\
\\003\000\002\000\083\000\082\000\
\\081\000\080\000\070\000\087\000\
\\099\000\031\000\035\000\029\000\
\\023\000\097\000\086\000\103\000\
\\118\000\051\000\052\000\065\000\
\\000\000\001\000\052\000\103\000\
\\001\000\001\000\001\000\001\000\
\\102\000\001\000\072\000\001\000\
\\100\000\076\000\001\000\105\000\
\\118\000\032\000\053\000\054\000\
\\030\000\024\000\017\000\117\000\
\\123\000\109\000\122\000\016\000\
\\014\000\112\000\025\000\013\000\
\\009\000\091\000\089\000\026\000\
\\027\000\095\000\001\000\098\000\
\\119\000\110\000\121\000\018\000\
\\118\000\115\000\055\000\056\000\
\\057\000\019\000\094\000\001\000\
\\001\000\078\000\077\000\050\000\
\\071\000\058\000\033\000\059\000\
\\126\000\125\000\124\000\001\000\
\\060\000\011\000\090\000\096\000\
\\039\000\111\000\116\000\052\000\
\\113\000\036\000\001\000\001\000\
\\127\000\001\000\092\000\120\000\
\\114\000\040\000"
val gotoT =
"\
\\001\000\004\000\003\000\169\000\006\000\003\000\007\000\002\000\
\\008\000\001\000\000\000\
\\007\000\023\000\008\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\045\000\006\000\003\000\000\000\
\\001\000\047\000\002\000\046\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\055\000\008\000\001\000\000\000\
\\000\000\
\\001\000\057\000\006\000\003\000\000\000\
\\001\000\058\000\006\000\003\000\000\000\
\\000\000\
\\001\000\059\000\006\000\003\000\000\000\
\\000\000\
\\001\000\061\000\006\000\003\000\000\000\
\\001\000\062\000\006\000\003\000\000\000\
\\001\000\063\000\006\000\003\000\000\000\
\\001\000\064\000\006\000\003\000\000\000\
\\001\000\065\000\006\000\003\000\000\000\
\\001\000\066\000\006\000\003\000\000\000\
\\001\000\067\000\006\000\003\000\000\000\
\\001\000\068\000\006\000\003\000\000\000\
\\001\000\069\000\006\000\003\000\000\000\
\\001\000\070\000\006\000\003\000\000\000\
\\001\000\071\000\006\000\003\000\000\000\
\\001\000\072\000\006\000\003\000\000\000\
\\001\000\073\000\006\000\003\000\000\000\
\\000\000\
\\001\000\075\000\006\000\003\000\000\000\
\\000\000\
\\004\000\077\000\000\000\
\\001\000\079\000\006\000\003\000\000\000\
\\001\000\081\000\005\000\080\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\047\000\002\000\103\000\006\000\003\000\000\000\
\\009\000\105\000\010\000\104\000\000\000\
\\000\000\
\\012\000\109\000\000\000\
\\000\000\
\\011\000\113\000\012\000\112\000\000\000\
\\001\000\117\000\006\000\003\000\000\000\
\\012\000\118\000\000\000\
\\001\000\047\000\002\000\119\000\006\000\003\000\000\000\
\\001\000\120\000\006\000\003\000\000\000\
\\001\000\121\000\006\000\003\000\000\000\
\\001\000\122\000\006\000\003\000\000\000\
\\001\000\081\000\005\000\123\000\006\000\003\000\000\000\
\\000\000\
\\001\000\081\000\005\000\124\000\006\000\003\000\000\000\
\\000\000\
\\001\000\125\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\001\000\081\000\005\000\127\000\006\000\003\000\000\000\
\\000\000\
\\009\000\128\000\010\000\104\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\144\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\009\000\146\000\010\000\104\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\153\000\006\000\003\000\000\000\
\\001\000\154\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\004\000\155\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\160\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\012\000\164\000\000\000\
\\000\000\
\\000\000\
\\001\000\166\000\006\000\003\000\000\000\
\\001\000\167\000\006\000\003\000\000\000\
\\000\000\
\\001\000\168\000\006\000\003\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 170
val numrules = 67
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit | CONST of  (int) | STRING of  (string) | ID of  (string) | TYFIELD of  (Ast.TyField) | TY of  (Ast.Ty) | CLASSFIELD of  (Ast.ClassField) | CLASSFIELDS of  (Ast.ClassField list) | DEC of  (Ast.Dec) | DECS of  (Ast.Dec list) | LVALUE of  (Ast.Lvalue) | HELP2 of  (Ast.Exp list) | HELP1 of  (Ast.Help1) | PROGRAM of  (Ast.Program) | EXPS of  (Ast.Exp list) | EXP of  (Ast.Exp)
end
type svalue = MlyValue.svalue
type result = Ast.Program
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn (T 46) => true | _ => false
val showTerminal =
fn (T 0) => "ARRAY"
  | (T 1) => "IF"
  | (T 2) => "THEN"
  | (T 3) => "ELSE"
  | (T 4) => "WHILE"
  | (T 5) => "FOR"
  | (T 6) => "TO"
  | (T 7) => "DO"
  | (T 8) => "LET"
  | (T 9) => "IN"
  | (T 10) => "END"
  | (T 11) => "OF"
  | (T 12) => "BREAK"
  | (T 13) => "NIL"
  | (T 14) => "FUNCTION"
  | (T 15) => "VAR"
  | (T 16) => "TYPE"
  | (T 17) => "IMPORT"
  | (T 18) => "PRIMITIVE"
  | (T 19) => "CLASS"
  | (T 20) => "EXTENDS"
  | (T 21) => "METHOD"
  | (T 22) => "NEW"
  | (T 23) => "COMMA"
  | (T 24) => "COLON"
  | (T 25) => "SEMICOLON"
  | (T 26) => "LEFTB"
  | (T 27) => "RIGHTB"
  | (T 28) => "LEFTSB"
  | (T 29) => "RIGHTSB"
  | (T 30) => "LEFTCB"
  | (T 31) => "RIGHTCB"
  | (T 32) => "DOT"
  | (T 33) => "PLUS"
  | (T 34) => "MINUS"
  | (T 35) => "MUL"
  | (T 36) => "DIV"
  | (T 37) => "EQUAL"
  | (T 38) => "LTGT"
  | (T 39) => "LT"
  | (T 40) => "LTEQUAL"
  | (T 41) => "GT"
  | (T 42) => "GTEQUAL"
  | (T 43) => "AND"
  | (T 44) => "OR"
  | (T 45) => "COLONEQUAL"
  | (T 46) => "EOF"
  | (T 47) => "ID"
  | (T 48) => "STRING"
  | (T 49) => "CONST"
  | (T 50) => "QUOTE"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 50) $$ (T 46) $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 3) $$ (T 2) $$ (T 1) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.EXP EXP, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.PROGRAM ((*#line 47.16 "tiger.grm"*) Ast.Expr EXP  (*#line 615.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, EXP1left, EXP1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.DECS DECS, DECS1left, DECS1right)) :: rest671)) => let val  result = MlyValue.PROGRAM ((*#line 48.11 "tiger.grm"*) Ast.Decr DECS	(*#line 619.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, DECS1left, DECS1right), rest671)
end
|  ( 2, ( ( _, ( _, NIL1left, NIL1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 52.14 "tiger.grm"*) Ast.Nil		(*#line 623.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, NIL1left, NIL1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.CONST CONST, CONST1left, CONST1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 53.16 "tiger.grm"*) Ast.Const	CONST 	(*#line 627.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, CONST1left, CONST1right), rest671)
end
|  ( 4, ( ( _, ( _, _, QUOTE2right)) :: ( _, ( MlyValue.STRING STRING, _, _)) :: ( _, ( _, QUOTE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 54.26 "tiger.grm"*) Ast.Quote STRING	(*#line 631.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, QUOTE1left, QUOTE2right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 57.46 "tiger.grm"*)Ast.ARRAYCREATE (Ast.Var ID) EXP1 EXP2(*#line 635.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, EXP2right), rest671)
end
|  ( 6, ( ( _, ( _, _, RIGHTCB1right)) :: ( _, ( MlyValue.HELP1 HELP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 58.31 "tiger.grm"*)Ast.RECORDCREATE (Ast.Var ID) HELP1(*#line 639.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, RIGHTCB1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: ( _, ( _, NEW1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 60.16 "tiger.grm"*)Ast.New (Ast.Var ID)	(*#line 643.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, NEW1left, ID1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 62.13 "tiger.grm"*) Ast.I1 (Ast.Var ID)	(*#line 647.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, ID1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, LVALUE1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 63.16 "tiger.grm"*) Ast.L LVALUE	(*#line 651.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LVALUE1left, LVALUE1right), rest671)
end
|  ( 10, ( ( _, ( _, _, RIGHTB1right)) :: ( _, ( MlyValue.HELP2 HELP2, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 65.30 "tiger.grm"*) Ast.FUNCTIONCALL (Ast.Var ID) HELP2	(*#line 655.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, RIGHTB1right), rest671)
end
|  ( 11, ( ( _, ( _, _, RIGHTB1right)) :: ( _, ( MlyValue.HELP2 HELP2, _, _)) :: _ :: _ :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 67.35 "tiger.grm"*) Ast.METHODCALL1 (Ast.Var ID) (Ast.Var ID) HELP2	(*#line 659.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, RIGHTB1right), rest671)
end
|  ( 12, ( ( _, ( _, _, RIGHTB1right)) :: ( _, ( MlyValue.HELP2 HELP2, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 68.39 "tiger.grm"*)Ast.METHODCALL2 LVALUE (Ast.Var ID) HELP2	(*#line 663.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LVALUE1left, RIGHTB1right), rest671)
end
|  ( 13, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: ( _, ( _, MINUS1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 70.18 "tiger.grm"*)Ast.Monominus EXP	(*#line 667.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, MINUS1left, EXP1right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 71.28 "tiger.grm"*) Ast.PLUS 	EXP1 EXP2  (*#line 671.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 72.29 "tiger.grm"*) Ast.MINUS 	EXP1 EXP2  (*#line 675.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 73.27 "tiger.grm"*) Ast.MUL 	EXP1 EXP2  (*#line 679.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 74.27 "tiger.grm"*) Ast.DIV 	EXP1 EXP2  (*#line 683.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 75.29 "tiger.grm"*) Ast.EQUAL 	EXP1 EXP2  (*#line 687.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 76.28 "tiger.grm"*) Ast.LTGT 	EXP1 EXP2  (*#line 691.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 77.26 "tiger.grm"*) Ast.GT 	EXP1 EXP2  (*#line 695.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 78.26 "tiger.grm"*) Ast.LT 	EXP1 EXP2  (*#line 699.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 79.31 "tiger.grm"*) Ast.GTEQUAL 	EXP1 EXP2  (*#line 703.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 80.31 "tiger.grm"*) Ast.LTEQUAL 	EXP1 EXP2  (*#line 707.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 81.27 "tiger.grm"*) Ast.AND 	EXP1 EXP2  (*#line 711.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 82.27 "tiger.grm"*) Ast.OR 	EXP1 EXP2  (*#line 715.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 26, ( ( _, ( _, _, RIGHTB1right)) :: ( _, ( MlyValue.EXPS EXPS, _, _)) :: ( _, ( _, LEFTB1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 83.24 "tiger.grm"*)Ast.OpList EXPS	(*#line 719.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LEFTB1left, RIGHTB1right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 85.42 "tiger.grm"*) Ast.ASSIGNMENT1 (Ast.Var ID) EXP (*#line 723.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, ID1left, EXP1right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 86.46 "tiger.grm"*) Ast.ASSIGNMENT2 LVALUE EXP (*#line 727.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LVALUE1left, EXP1right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 88.38 "tiger.grm"*) Ast.IF EXP1 EXP2 (*#line 731.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, IF1left, EXP2right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.EXP EXP3, _, EXP3right)) :: _ :: ( _, ( MlyValue.EXP EXP2, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 89.42 "tiger.grm"*) Ast.ELSE EXP1 EXP2 EXP3(*#line 735.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, IF1left, EXP3right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 90.36 "tiger.grm"*) Ast.WHILE  EXP1 EXP2 	(*#line 739.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, WHILE1left, EXP2right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.EXP EXP3, _, EXP3right)) :: _ :: ( _, ( MlyValue.EXP EXP2, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, FOR1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 91.52 "tiger.grm"*) Ast.FOR (Ast.Var ID) EXP1 EXP2 EXP3 (*#line 743.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, FOR1left, EXP3right), rest671)
end
|  ( 33, ( ( _, ( _, BREAK1left, BREAK1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 92.16 "tiger.grm"*) Ast.Break	 (*#line 747.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, BREAK1left, BREAK1right), rest671)
end
|  ( 34, ( ( _, ( _, _, END1right)) :: ( _, ( MlyValue.EXPS EXPS, _, _)) :: _ :: ( _, ( MlyValue.DECS DECS, _, _)) :: ( _, ( _, LET1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 93.29 "tiger.grm"*) Ast.LET  DECS EXPS (*#line 751.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, LET1left, END1right), rest671)
end
|  ( 35, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.HELP1 ((*#line 96.26 "tiger.grm"*)Ast.HELP11 (Ast.Var ID ) EXP (*#line 755.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, ID1left, EXP1right), rest671)
end
|  ( 36, ( ( _, ( MlyValue.HELP1 HELP1, _, HELP11right)) :: _ :: ( _, ( MlyValue.EXP EXP, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.HELP1 ((*#line 97.30 "tiger.grm"*)Ast.HELP12 (Ast.Var ID ) EXP HELP1 (*#line 759.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, ID1left, HELP11right), rest671)
end
|  ( 37, ( ( _, ( MlyValue.EXP EXP, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.HELP2 ((*#line 99.17 "tiger.grm"*) EXP :: []  (*#line 763.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXP1left, EXP1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.HELP2 HELP2, _, HELP21right)) :: _ :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.HELP2 ((*#line 100.21 "tiger.grm"*) EXP :: HELP2	(*#line 767.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXP1left, HELP21right), rest671)
end
|  ( 39, ( ( _, ( _, _, ID2right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 103.21 "tiger.grm"*)Ast.LVALUE1 (Ast.Var ID) (Ast.Var ID)(*#line 771.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, ID1left, ID2right), rest671)
end
|  ( 40, ( ( _, ( _, _, RIGHTSB1right)) :: ( _, ( MlyValue.EXP EXP, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 104.27 "tiger.grm"*)Ast.LVALUE2 (Ast.Var ID) EXP(*#line 775.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, ID1left, RIGHTSB1right), rest671)
end
|  ( 41, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 105.19 "tiger.grm"*)Ast.LVALUE3 LVALUE (Ast.Var ID)(*#line 779.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, LVALUE1left, ID1right), rest671)
end
|  ( 42, ( ( _, ( _, _, RIGHTSB1right)) :: ( _, ( MlyValue.EXP EXP, _, _)) :: _ :: ( _, ( MlyValue.LVALUE LVALUE, LVALUE1left, _)) :: rest671)) => let val  result = MlyValue.LVALUE ((*#line 106.31 "tiger.grm"*)Ast.LVALUE4 LVALUE EXP(*#line 783.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, LVALUE1left, RIGHTSB1right), rest671)
end
|  ( 43, ( rest671)) => let val  result = MlyValue.EXPS ((*#line 109.21 "tiger.grm"*) []	(*#line 787.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, defaultPos, defaultPos), rest671)
end
|  ( 44, ( ( _, ( MlyValue.EXP EXP, EXP1left, EXP1right)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 110.10 "tiger.grm"*) EXP :: []	(*#line 791.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXP1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.EXPS EXPS, _, EXPS1right)) :: _ :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 111.24 "tiger.grm"*) EXP :: EXPS	(*#line 795.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXPS1right), rest671)
end
|  ( 46, ( rest671)) => let val  result = MlyValue.DECS ((*#line 114.19 "tiger.grm"*) []	(*#line 799.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, defaultPos, defaultPos), rest671)
end
|  ( 47, ( ( _, ( MlyValue.DECS DECS, _, DECS1right)) :: ( _, ( MlyValue.DEC DEC, DEC1left, _)) :: rest671)) => let val  result = MlyValue.DECS ((*#line 115.14 "tiger.grm"*) DEC :: DECS	(*#line 803.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, DEC1left, DECS1right), rest671)
end
|  ( 48, ( ( _, ( MlyValue.TY TY, _, TY1right)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, TYPE1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 119.22 "tiger.grm"*)Ast.TYDEC (Ast.Var ID) TY	(*#line 807.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, TYPE1left, TY1right), rest671)
end
|  ( 49, ( ( _, ( _, _, RIGHTCB1right)) :: ( _, ( MlyValue.CLASSFIELDS CLASSFIELDS, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, CLASS1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 121.41 "tiger.grm"*)Ast.CLASSALT1 (Ast.Var ID) CLASSFIELDS	(*#line 811.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, CLASS1left, RIGHTCB1right), rest671)
end
|  ( 50, ( ( _, ( _, _, RIGHTCB1right)) :: ( _, ( MlyValue.CLASSFIELDS CLASSFIELDS, _, _)) :: _ :: _ :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, CLASS1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 122.52 "tiger.grm"*)Ast.CLASSALT2 (Ast.Var ID) (Ast.Var ID) CLASSFIELDS	(*#line 815.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, CLASS1left, RIGHTCB1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 124.27 "tiger.grm"*)Ast.VARDEC (Ast.Var ID) EXP	(*#line 819.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, VAR1left, EXP1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 126.49 "tiger.grm"*) Ast.FUNDEC1 (Ast.Var ID) TYFIELD EXP (*#line 823.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, FUNCTION1left, EXP1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: _ :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, FUNCTION1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 127.57 "tiger.grm"*) Ast.FUNDEC2 (Ast.Var ID) TYFIELD (Ast.Var ID) EXP (*#line 827.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, FUNCTION1left, EXP1right), rest671)
end
|  ( 54, ( ( _, ( _, _, RIGHTB1right)) :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, PRIMITIVE1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 129.39 "tiger.grm"*)Ast.PRIMDEC1 (Ast.Var ID) TYFIELD(*#line 831.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, PRIMITIVE1left, RIGHTB1right), rest671)
end
|  ( 55, ( ( _, ( _, _, ID2right)) :: _ :: _ :: ( _, ( MlyValue.TYFIELD TYFIELD, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, PRIMITIVE1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 130.47 "tiger.grm"*)Ast.PRIMDEC2 (Ast.Var ID) TYFIELD (Ast.Var ID)(*#line 835.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, PRIMITIVE1left, ID2right), rest671)
end
|  ( 56, ( ( _, ( _, _, QUOTE2right)) :: ( _, ( MlyValue.STRING STRING, _, _)) :: _ :: ( _, ( _, IMPORT1left, _)) :: rest671)) => let val  result = MlyValue.DEC ((*#line 132.31 "tiger.grm"*)Ast.Import (Ast.Quote STRING)(*#line 839.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, IMPORT1left, QUOTE2right), rest671)
end
|  ( 57, ( rest671)) => let val  result = MlyValue.CLASSFIELDS ((*#line 135.28 "tiger.grm"*) [] (*#line 843.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, defaultPos, defaultPos), rest671)
end
|  ( 58, ( ( _, ( MlyValue.CLASSFIELDS CLASSFIELDS, _, CLASSFIELDS1right)) :: ( _, ( MlyValue.CLASSFIELD CLASSFIELD, CLASSFIELD1left, _)) :: rest671)) => let val  result = MlyValue.CLASSFIELDS ((*#line 136.28 "tiger.grm"*)CLASSFIELD :: CLASSFIELDS(*#line 847.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, CLASSFIELD1left, CLASSFIELDS1right), rest671)
end
|  ( 59, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: _ :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, VAR1left, _)) :: rest671)) => let val  result = MlyValue.CLASSFIELD ((*#line 140.37 "tiger.grm"*)Ast.ATTRDEC (Ast.Var ID) (Ast.Var ID) EXP (*#line 851.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, VAR1left, EXP1right), rest671)
end
|  ( 60, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: ( _, ( _, METHOD1left, _)) :: rest671)) => let val  result = MlyValue.CLASSFIELD ((*#line 141.16 "tiger.grm"*)Ast.Method (Ast.Var ID)(*#line 855.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, METHOD1left, ID1right), rest671)
end
|  ( 61, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.TY ((*#line 143.12 "tiger.grm"*) Ast.I2 (Ast.Var ID)	(*#line 859.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, ID1left, ID1right), rest671)
end
|  ( 62, ( ( _, ( MlyValue.TYFIELD TYFIELD, TYFIELD1left, TYFIELD1right)) :: rest671)) => let val  result = MlyValue.TY ((*#line 145.16 "tiger.grm"*) Ast.T TYFIELD (*#line 863.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, TYFIELD1left, TYFIELD1right), rest671)
end
|  ( 63, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: _ :: ( _, ( _, ARRAY1left, _)) :: rest671)) => let val  result = MlyValue.TY ((*#line 147.18 "tiger.grm"*) Ast.ArrayDef (Ast.Var ID)(*#line 867.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, ARRAY1left, ID1right), rest671)
end
|  ( 64, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: _ :: ( _, ( _, CLASS1left, _)) :: rest671)) => let val  result = MlyValue.TY ((*#line 149.23 "tiger.grm"*)Ast.ClassCan (Ast.Var ID)(*#line 871.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, CLASS1left, ID1right), rest671)
end
|  ( 65, ( ( _, ( _, _, ID2right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD ((*#line 151.26 "tiger.grm"*) Ast.TYFIELD1 (Ast.Var ID) (Ast.Var ID)     (*#line 875.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, ID1left, ID2right), rest671)
end
|  ( 66, ( ( _, ( MlyValue.TYFIELD TYFIELD, _, TYFIELD1right)) :: _ :: _ :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.TYFIELD ((*#line 152.31 "tiger.grm"*) Ast.TYFIELD2 (Ast.Var ID) (Ast.Var ID) TYFIELD (*#line 879.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, ID1left, TYFIELD1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.PROGRAM x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : EXP_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun ARRAY (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.VOID,p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.VOID,p1,p2))
fun TO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.VOID,p1,p2))
fun LET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.VOID,p1,p2))
fun IN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.VOID,p1,p2))
fun END (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.VOID,p1,p2))
fun OF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(ParserData.MlyValue.VOID,p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(ParserData.MlyValue.VOID,p1,p2))
fun NIL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(ParserData.MlyValue.VOID,p1,p2))
fun FUNCTION (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(ParserData.MlyValue.VOID,p1,p2))
fun VAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(ParserData.MlyValue.VOID,p1,p2))
fun TYPE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(ParserData.MlyValue.VOID,p1,p2))
fun IMPORT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(ParserData.MlyValue.VOID,p1,p2))
fun PRIMITIVE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(ParserData.MlyValue.VOID,p1,p2))
fun CLASS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(ParserData.MlyValue.VOID,p1,p2))
fun EXTENDS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(ParserData.MlyValue.VOID,p1,p2))
fun METHOD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(ParserData.MlyValue.VOID,p1,p2))
fun NEW (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(ParserData.MlyValue.VOID,p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(ParserData.MlyValue.VOID,p1,p2))
fun COLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(ParserData.MlyValue.VOID,p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(ParserData.MlyValue.VOID,p1,p2))
fun LEFTB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(ParserData.MlyValue.VOID,p1,p2))
fun RIGHTB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(ParserData.MlyValue.VOID,p1,p2))
fun LEFTSB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(ParserData.MlyValue.VOID,p1,p2))
fun RIGHTSB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(ParserData.MlyValue.VOID,p1,p2))
fun LEFTCB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(ParserData.MlyValue.VOID,p1,p2))
fun RIGHTCB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(ParserData.MlyValue.VOID,p1,p2))
fun DOT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(ParserData.MlyValue.VOID,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(ParserData.MlyValue.VOID,p1,p2))
fun MUL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(ParserData.MlyValue.VOID,p1,p2))
fun DIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(ParserData.MlyValue.VOID,p1,p2))
fun EQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(ParserData.MlyValue.VOID,p1,p2))
fun LTGT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(ParserData.MlyValue.VOID,p1,p2))
fun LTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(ParserData.MlyValue.VOID,p1,p2))
fun GTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(ParserData.MlyValue.VOID,p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(ParserData.MlyValue.VOID,p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(ParserData.MlyValue.VOID,p1,p2))
fun COLONEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(ParserData.MlyValue.VOID,p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 46,(ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 47,(ParserData.MlyValue.ID i,p1,p2))
fun STRING (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 48,(ParserData.MlyValue.STRING i,p1,p2))
fun CONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 49,(ParserData.MlyValue.CONST i,p1,p2))
fun QUOTE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 50,(ParserData.MlyValue.VOID,p1,p2))
end
end
