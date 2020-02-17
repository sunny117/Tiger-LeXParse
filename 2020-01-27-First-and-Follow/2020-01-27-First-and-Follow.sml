type Symbol = Atom.atom
type Token  = Atom.atom

type Symbols = AtomSet.set 
type Tokens  = AtomSet.set   

type RHS    = Atom.atom list
type LHS    = Atom.atom 

structure RHS_KEY : ORD_KEY = struct
    type ord_key = RHS
    val compare  = List.collate Atom.compare
end

structure LHS_KEY : ORD_KEY = struct
    type ord_key = LHS
    val compare  = Atom.compare
end

structure RHSSet = RedBlackSetFn (RHS_KEY);
structure RHSMap = RedBlackMapFn (LHS_KEY);

type Productions = RHSSet.set
type Rules 	 = Productions AtomMap.map
type Grammar = { symbols : Symbols, tokens : Tokens, rules : Rules }
