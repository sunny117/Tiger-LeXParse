
structure MIPS = struct
	
	datatype regs = zero | at | v0 | v1 | a0 | a1 | a2 | a3 | t0 | t1 | t2 | t3 | t4 | t5 | t6 | t7 | s0 | s1 | s2 | s3 | s4 | s5 | s6 | s7 | t8 | t9 | k0 | k1 | gp | sp | fp | ra
	
	datatype Arithmatic  = Add | Sub | Addu | Subu | Mul
	datatype Arithmatici = Addi | Addiu
	datatype Arithmatic1 = Mult | Div
	
	datatype Logical	= And | Or
	datatype Logicali	= Andi | Ori | Sll | Srl
	
	datatype DataTransfer1	= Lw | Sw
	datatype DataTransfer2	= Lui | Li
	datatype DataTransfer3	= La
	datatype DataTransfer4	= Mfhi | Mflo
	datatype DataTransfer5	= Move
	
	datatype ConditionalBranch	= Beq | Bne | Bgt | Bge | Blt | Ble
	
	datatype Comparision1 = Slt
	datatype Comparision2 = Slti
	
	datatype UnconditionalJump1 = J | Jal
	datatype UnconditionalJump2 = Jr
	 		
	datatype ('l,'t) inst = Arith1 of Arithmatic * 't * 't * 't
						| Arith2 of Arithmatici * 't * 't * int
						| Arith3 of Arithmatic1 *'t * 't
						| Logic1 of Logical * 't * 't * 't
						| Logic2 of Logicali * 't * 't * int
						| DataTrans1 of DataTransfer1 * 't * int * 't
						| DataTrans2 of DataTransfer2 * 't * int
						| DataTrans3 of DataTransfer3 * 't * 'l
						| DataTrans4 of DataTransfer4 * 't
						| DataTrans5 of DataTransfer5 * 't * 't
						| CondBranch of ConditionalBranch * 't * 't * 'l
						| Comp1	of Comparision1 * 't * 't * 't
						| Comp2 of Comparision2 * 't * 't * int
						| Uncond1 of UnconditionalJump1 * 'l
						| Uncond2 of UnconditionalJump2 * 't
						
						
	fun Arith1_helper x = case x of
							  Add => "add"
							| Sub => "sub"
							| Addu => "addu"
							| Subu => "subu"
							| Mul => "mul"
	
	fun Arith2_helper x = case x of
							  Addi => "addi"
							| Addiu => "addiu"
							
	fun Arith3_helper x = case x of
							  Mult => "mult"
							| Div => "div"
							
	fun Logic1_helper x = case x of
							And => "and"
							| Or => "or"
							
	fun Logic2_helper x = case x of
							Andi => "andi"
							| Ori => "ori"
							| Sll => "sll"
							| Srl => "srl"
							
	fun DataTrans1_helper x = case x of
	
	fun pretty (Arith1(x,a,b,c)) = Arith1_helper ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty (Arith2(Addi,a,b,c)) = Arith2_helper ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty (Arith3(Mult,a,b)) = Arith3_helper ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b)
	| pretty (Logic1(And,a,b,c)) = Logic1_helper ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty (Logic2(Andi,a,b,c)) = Logic2_helper ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty (DataTrans1(Lw,a,b,c)) = DataTrans1_helper ^ " $" ^ Int.toString(a) ^ " " ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pratty (DataTrans2(Lui,a,b)) = Arith1_helper ^ " $" ^ Int.toString(a) ^ " " ^ Int.toString(b)
	| pretty (DataTrans3(La,a,b)) = Arith1_helper ^ " $" ^ Int.toString(a) ^ " " ^ b
	| pretty (DataTrans4(Mfhi,a)) = Arith1_helper ^ " $" ^ Int.toString(a)
	| pretty (DataTrans5(Move,a,b)) = Arith1_helper ^ " $" ^ Int.toString(a) ^ " " ^ Int.toString(b)
	| pretty (CondBranch(Beq,a,b,c)) = Arith1_helper ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ c



end
