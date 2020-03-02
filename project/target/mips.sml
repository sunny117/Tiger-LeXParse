
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
							  Lw => "lw"
							| Sw => "sw"
	
	fun DataTrans2_helper x = case x of
							  Lui => "lui"
							| Li => "li"
							
	fun DataTrans3_helper x = case x of
							  La => "la"
	
	fun DataTrans4_helper x = case x of
							  Mfhi => "mfhi"
							| Mflo => "mflo"  
							
	fun DataTrans5_helper x = case x of
							  Move => "move"
				
	fun CondBranch_helper x = case x of
							  Beq => "beq"
							| Bne => "bne"
							| Bgt => "bgt"
							| Bge => "bge"
							| Blt => "blt"
							| Ble => "ble"
							
	fun Comp1_helper x = case x of
							Slt => "slt"
							
	fun Comp2_helper x = case x of
							Slti => "slti"

	fun Uncond1_helper x = case x of
							  J => "j"
							| Jal => "jal"
	
	fun Uncond2_helper x = case x of
							Jr => "jar"

	fun pretty (Arith1(x,a,b,c)) = (Arith1_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty (Arith2(x,a,b,c)) = (Arith2_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty (Arith3(x,a,b)) = (Arith3_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b)
	| pretty (Logic1(x,a,b,c)) = (Logic1_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty (Logic2(x,a,b,c)) = (Logic2_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty (DataTrans1(x,a,b,c)) = (DataTrans1_helper x) ^ " $" ^ Int.toString(a) ^ " " ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty (DataTrans2(x,a,b)) = (DataTrans2_helper x) ^ " $" ^ Int.toString(a) ^ " " ^ Int.toString(b)
	| pretty (DataTrans3(x,a,b)) = (DataTrans3_helper x) ^ " $" ^ Int.toString(a) ^ " " ^ b
	| pretty (DataTrans4(x,a)) = (DataTrans4_helper x) ^ " $" ^ Int.toString(a)
	| pretty (DataTrans5(x,a,b)) = (DataTrans5_helper x) ^ " $" ^ Int.toString(a) ^ " " ^ Int.toString(b)
	| pretty (CondBranch(x,a,b,c)) = (CondBranch_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ c
	| pretty (Comp1(x,a,b,c)) = (Comp1_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty (Comp2(x,a,b,c)) = (Comp2_helper x) ^ " $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty (Uncond1(x,a)) = (Uncond1_helper x) ^ " " ^ a
	| pretty (Uncond2(x,a)) = (Uncond2_helper x) ^ " $" ^ Int.toString(a)
end
