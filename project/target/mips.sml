
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
						
	fun pretty Arith1(And,a,b,c) = "add $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty Arith2(Addi,a,b,c) = "addi $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty Arith3(Mult,a,b) = "mult $" ^ Int.toString(a) ^ " $" ^ Int.toString(b)
	| pretty Logic1(And,a,b,c) = "and $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pretty Logic12(Andi,a,b,c) = "andi $" ^ Int.toString(a) ^ " $" ^ Int.toString(b) ^ " " ^ Int.toString(c)
	| pretty DataTrans1(Lw,a,b,c) = "lw $" ^ Int.toString(a) ^ " " ^ Int.toString(b) ^ " $" ^ Int.toString(c)
	| pratty DataTrans2(Lui,a,b) = "lui $" ^ Int.toString(a) ^ " " ^ Int.toString(b)
	| pretty DataTrans3(La,a,b) = "la $" ^ Int.toString(a) ^ " " ^ b
	| pretty DataTrans4(Mfhi,a) = "mfhi $" ^ Int.toString(a)



end
