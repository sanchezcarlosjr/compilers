	.data
	.align	2
	.globl	class_nameTab
	.globl	Main_protObj
	.globl	Int_protObj
	.globl	String_protObj
	.globl	bool_const0
	.globl	bool_const1
	.globl	_int_tag
	.globl	_bool_tag
	.globl	_string_tag
_int_tag:
	.word	5
_bool_tag:
	.word	6
_string_tag:
	.word	7
	.globl	_MemMgr_INITIALIZER
_MemMgr_INITIALIZER:
	.word	_NoGC_Init
	.globl	_MemMgr_COLLECTOR
_MemMgr_COLLECTOR:
	.word	_NoGC_Collect
	.globl	_MemMgr_TEST
_MemMgr_TEST:
	.word	0
	.word	-1
str_const47:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"Number"
	.byte	0	
	.align	2
	.word	-1
str_const46:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"Displaying"
	.byte	0	
	.align	2
	.word	-1
str_const45:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"Evaluation"
	.byte	0	
	.align	2
	.word	-1
str_const44:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"Exchanger"
	.byte	0	
	.align	2
	.word	-1
str_const43:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Plus"
	.byte	0	
	.align	2
	.word	-1
str_const42:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Token"
	.byte	0	
	.align	2
	.word	-1
str_const41:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Cons"
	.byte	0	
	.align	2
	.word	-1
str_const40:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"List"
	.byte	0	
	.align	2
	.word	-1
str_const39:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"A2I"
	.byte	0	
	.align	2
	.word	-1
str_const38:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const37:
	.word	7
	.word	8
	.word	String_dispTab
	.word	int_const11
	.ascii	"StackMachine"
	.byte	0	
	.align	2
	.word	-1
str_const36:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const35:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const34:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const33:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const32:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const31:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const10
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const30:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const29:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const28:
	.word	7
	.word	8
	.word	String_dispTab
	.word	int_const12
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const27:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	" "
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	7
	.word	21
	.word	String_dispTab
	.word	int_const13
	.ascii	"I'm not a number. Probably you're trying to add invalid tokens.\n"
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	7
	.word	13
	.word	String_dispTab
	.word	int_const14
	.ascii	"Stack was evaluated incorrecly.\n"
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"tokens.cl"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"-"
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	7
	.word	19
	.word	String_dispTab
	.word	int_const15
	.ascii	" is not recognized. Each command must be an unique type. \n"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"9"
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"8"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"7"
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"6"
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"5"
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"4"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"3"
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"2"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"1"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"0"
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"list.cl"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"atoi.cl"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"x"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"d"
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"e"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"s"
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"+"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"\n>"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const8
	.ascii	"Stopping"
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const0
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const8
	.ascii	"stack.cl"
	.byte	0	
	.align	2
	.word	-1
int_const15:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	58
	.word	-1
int_const14:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	32
	.word	-1
int_const13:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	64
	.word	-1
int_const12:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const11:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	12
	.word	-1
int_const10:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	10
	.word	-1
int_const9:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	9
	.word	-1
int_const8:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	8
	.word	-1
int_const7:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	7
	.word	-1
int_const6:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const5:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	5
	.word	-1
int_const4:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const3:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
int_const2:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	2
	.word	-1
int_const1:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const0:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
bool_const0:
	.word	6
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
bool_const1:
	.word	6
	.word	4
	.word	Bool_dispTab
	.word	1
class_nameTab:
	.word	str_const32
	.word	str_const33
	.word	str_const37
	.word	str_const38
	.word	str_const39
	.word	str_const34
	.word	str_const35
	.word	str_const36
	.word	str_const40
	.word	str_const41
	.word	str_const42
	.word	str_const43
	.word	str_const44
	.word	str_const45
	.word	str_const46
	.word	str_const2
	.word	str_const47
class_objTab:
	.word	Object_protObj
	.word	Object_init
	.word	IO_protObj
	.word	IO_init
	.word	StackMachine_protObj
	.word	StackMachine_init
	.word	Main_protObj
	.word	Main_init
	.word	A2I_protObj
	.word	A2I_init
	.word	Int_protObj
	.word	Int_init
	.word	Bool_protObj
	.word	Bool_init
	.word	String_protObj
	.word	String_init
	.word	List_protObj
	.word	List_init
	.word	Cons_protObj
	.word	Cons_init
	.word	Token_protObj
	.word	Token_init
	.word	Plus_protObj
	.word	Plus_init
	.word	Exchanger_protObj
	.word	Exchanger_init
	.word	Evaluation_protObj
	.word	Evaluation_init
	.word	Displaying_protObj
	.word	Displaying_init
	.word	Stopping_protObj
	.word	Stopping_init
	.word	Number_protObj
	.word	Number_init
Object_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Token_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Token.print
	.word	Token.evaluate
	.word	Token.ensureValid
	.word	Token.add
	.word	Token.get
	.word	Token.execute
Number_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Number.print
	.word	Number.evaluate
	.word	Token.ensureValid
	.word	Number.add
	.word	Number.get
	.word	Token.execute
	.word	Number.construct
	.word	Number.parse
Stopping_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Stopping.print
	.word	Token.evaluate
	.word	Token.ensureValid
	.word	Token.add
	.word	Token.get
	.word	Token.execute
Displaying_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Displaying.print
	.word	Token.evaluate
	.word	Token.ensureValid
	.word	Token.add
	.word	Token.get
	.word	Displaying.execute
Evaluation_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Evaluation.print
	.word	Token.evaluate
	.word	Token.ensureValid
	.word	Token.add
	.word	Token.get
	.word	Evaluation.execute
Exchanger_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Exchanger.print
	.word	Exchanger.evaluate
	.word	Token.ensureValid
	.word	Token.add
	.word	Token.get
	.word	Token.execute
Plus_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Plus.print
	.word	Plus.evaluate
	.word	Token.ensureValid
	.word	Token.add
	.word	Token.get
	.word	Token.execute
List_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	List.isNil
	.word	List.head
	.word	List.tail
	.word	List.cons
Cons_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Cons.isNil
	.word	Cons.head
	.word	Cons.tail
	.word	List.cons
	.word	Cons.init
String_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	String.length
	.word	String.concat
	.word	String.substr
Bool_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Int_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
IO_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
A2I_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	A2I.c2i
	.word	A2I.i2c
	.word	A2I.a2i
	.word	A2I.a2i_aux
	.word	A2I.i2a
	.word	A2I.i2a_aux
Main_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Main.main
StackMachine_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	StackMachine.read
	.word	StackMachine.scan
	.word	-1
Object_protObj:
	.word	0
	.word	3
	.word	Object_dispTab
	.word	-1
Token_protObj:
	.word	10
	.word	3
	.word	Token_dispTab
	.word	-1
Number_protObj:
	.word	16
	.word	5
	.word	Number_dispTab
	.word	int_const0
	.word	0
	.word	-1
Stopping_protObj:
	.word	15
	.word	3
	.word	Stopping_dispTab
	.word	-1
Displaying_protObj:
	.word	14
	.word	3
	.word	Displaying_dispTab
	.word	-1
Evaluation_protObj:
	.word	13
	.word	3
	.word	Evaluation_dispTab
	.word	-1
Exchanger_protObj:
	.word	12
	.word	3
	.word	Exchanger_dispTab
	.word	-1
Plus_protObj:
	.word	11
	.word	3
	.word	Plus_dispTab
	.word	-1
List_protObj:
	.word	8
	.word	3
	.word	List_dispTab
	.word	-1
Cons_protObj:
	.word	9
	.word	5
	.word	Cons_dispTab
	.word	0
	.word	0
	.word	-1
String_protObj:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const0
	.word	0
	.word	-1
Bool_protObj:
	.word	6
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
Int_protObj:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
IO_protObj:
	.word	1
	.word	3
	.word	IO_dispTab
	.word	-1
A2I_protObj:
	.word	4
	.word	3
	.word	A2I_dispTab
	.word	-1
Main_protObj:
	.word	3
	.word	3
	.word	Main_dispTab
	.word	-1
StackMachine_protObj:
	.word	2
	.word	3
	.word	StackMachine_dispTab
	.globl	heap_start
heap_start:
	.word	0
	.text
	.globl	Main_init
	.globl	Int_init
	.globl	String_init
	.globl	Bool_init
	.globl	Main.main
Object_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Token_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Number_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Token_init
	la	$a0 int_const0
	sw	$a0 12($s0)
	la	$a0 A2I_protObj
	jal	Object.copy
	jal	A2I_init
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Stopping_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Token_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Displaying_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Token_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Evaluation_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Token_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Exchanger_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Token_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Plus_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Token_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
List_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Cons_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	List_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
String_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Bool_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Int_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
IO_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
A2I_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Main_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
StackMachine_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Token.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label0
	la	$a0 str_const23
	li	$t1 8
	jal	_dispatch_abort
label0:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Token.evaluate:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const24
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label1
	la	$a0 str_const23
	li	$t1 11
	jal	_dispatch_abort
label1:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$a0 $s0
	bne	$a0 $zero label2
	la	$a0 str_const23
	li	$t1 12
	jal	_dispatch_abort
label2:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	lw	$a0 0($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Token.ensureValid:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	bne	$a0 $zero label3
	la	$a0 str_const23
	li	$t1 18
	jal	_dispatch_abort
label3:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 0($fp)
	lw	$a0 0($fp)
	bne	$a0 $zero label6
	la	$a0 str_const23
	li	$t1 19
	jal	_dispatch_abort
label6:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$t1 12($a0)
	beqz	$t1 label4
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label7
	la	$a0 str_const23
	li	$t1 19
	jal	_dispatch_abort
label7:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	lw	$a0 0($fp)
	b	label5
label4:
	lw	$a0 0($fp)
	bne	$a0 $zero label10
	la	$a0 str_const23
	li	$t1 20
	jal	_dispatch_abort
label10:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label11
	la	$a0 str_const23
	li	$t1 20
	jal	_dispatch_abort
label11:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$t1 12($a0)
	beqz	$t1 label8
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label12
	la	$a0 str_const23
	li	$t1 20
	jal	_dispatch_abort
label12:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	lw	$a0 0($fp)
	b	label9
label8:
	lw	$a0 0($fp)
label9:
label5:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Token.add:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label13
	la	$a0 str_const23
	li	$t1 27
	jal	_dispatch_abort
label13:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$a0 $s0
	bne	$a0 $zero label14
	la	$a0 str_const23
	li	$t1 28
	jal	_dispatch_abort
label14:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	lw	$a0 0($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Token.get:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label15
	la	$a0 str_const23
	li	$t1 34
	jal	_dispatch_abort
label15:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$a0 $s0
	bne	$a0 $zero label16
	la	$a0 str_const23
	li	$t1 35
	jal	_dispatch_abort
label16:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	la	$a0 int_const0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Token.execute:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	move	$a0 $s0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label17
	la	$a0 str_const23
	li	$t1 41
	jal	_dispatch_abort
label17:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Number.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label18
	la	$a0 str_const23
	li	$t1 107
	jal	_dispatch_abort
label18:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Number.evaluate:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Number.add:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	lw	$s1 12($s0)
	lw	$a0 8($fp)
	bne	$a0 $zero label19
	la	$a0 str_const23
	li	$t1 112
	jal	_dispatch_abort
label19:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr	$t1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Number_protObj
	jal	Object.copy
	jal	Number_init
	bne	$a0 $zero label20
	la	$a0 str_const23
	li	$t1 113
	jal	_dispatch_abort
label20:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr	$t1
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
Number.get:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Number.construct:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Number.parse:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($s0)
	bne	$a0 $zero label21
	la	$a0 str_const23
	li	$t1 125
	jal	_dispatch_abort
label21:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr	$t1
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Stopping.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label22
	la	$a0 str_const23
	li	$t1 99
	jal	_dispatch_abort
label22:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Displaying.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	bne	$a0 $zero label25
	la	$a0 str_const23
	li	$t1 80
	jal	_dispatch_abort
label25:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$t1 12($a0)
	beqz	$t1 label23
	la	$a0 str_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label26
	la	$a0 str_const23
	li	$t1 81
	jal	_dispatch_abort
label26:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	b	label24
label23:
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label27
	la	$a0 str_const23
	li	$t1 82
	jal	_dispatch_abort
label27:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	bne	$a0 $zero label28
	la	$a0 str_const23
	li	$t1 82
	jal	_dispatch_abort
label28:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	la	$a0 str_const27
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label29
	la	$a0 str_const23
	li	$t1 83
	jal	_dispatch_abort
label29:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$a0 0($fp)
	bne	$a0 $zero label30
	la	$a0 str_const23
	li	$t1 84
	jal	_dispatch_abort
label30:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label31
	la	$a0 str_const23
	li	$t1 84
	jal	_dispatch_abort
label31:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
label24:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Displaying.execute:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label32
	la	$a0 str_const23
	li	$t1 90
	jal	_dispatch_abort
label32:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$a0 0($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Evaluation.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const6
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label33
	la	$a0 str_const23
	li	$t1 72
	jal	_dispatch_abort
label33:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Evaluation.execute:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label34
	la	$a0 str_const23
	li	$t1 74
	jal	_dispatch_abort
label34:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	bne	$a0 $zero label35
	la	$a0 str_const23
	li	$t1 75
	jal	_dispatch_abort
label35:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Exchanger.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label36
	la	$a0 str_const23
	li	$t1 59
	jal	_dispatch_abort
label36:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Exchanger.evaluate:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	la	$a0 Token_protObj
	jal	Object.copy
	jal	Token_init
	move	$s1 $a0
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label37
	la	$a0 str_const23
	li	$t1 62
	jal	_dispatch_abort
label37:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 8($fp)
	lw	$a0 8($fp)
	bne	$a0 $zero label38
	la	$a0 str_const23
	li	$t1 63
	jal	_dispatch_abort
label38:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label39
	la	$a0 str_const23
	li	$t1 63
	jal	_dispatch_abort
label39:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	move	$s1 $a0
	sw	$s1 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label40
	la	$a0 str_const23
	li	$t1 64
	jal	_dispatch_abort
label40:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label41
	la	$a0 str_const23
	li	$t1 64
	jal	_dispatch_abort
label41:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label42
	la	$a0 str_const23
	li	$t1 64
	jal	_dispatch_abort
label42:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label43
	la	$a0 str_const23
	li	$t1 64
	jal	_dispatch_abort
label43:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr	$t1
	bne	$a0 $zero label44
	la	$a0 str_const23
	li	$t1 64
	jal	_dispatch_abort
label44:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr	$t1
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
Plus.print:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 str_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	bne	$a0 $zero label45
	la	$a0 str_const23
	li	$t1 47
	jal	_dispatch_abort
label45:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Plus.evaluate:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label46
	la	$a0 str_const23
	li	$t1 50
	jal	_dispatch_abort
label46:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 0($fp)
	lw	$a0 0($fp)
	bne	$a0 $zero label47
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label47:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label48
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label48:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label49
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label49:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	bne	$a0 $zero label50
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label50:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label51
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label51:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label52
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label52:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	bne	$a0 $zero label53
	la	$a0 str_const23
	li	$t1 51
	jal	_dispatch_abort
label53:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
List.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 bool_const1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
List.head:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label54
	la	$a0 str_const10
	li	$t1 35
	jal	_dispatch_abort
label54:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	la	$a0 Token_protObj
	jal	Object.copy
	jal	Token_init
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
List.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label55
	la	$a0 str_const10
	li	$t1 40
	jal	_dispatch_abort
label55:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
List.cons:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Cons_protObj
	jal	Object.copy
	jal	Cons_init
	bne	$a0 $zero label56
	la	$a0 str_const10
	li	$t1 51
	jal	_dispatch_abort
label56:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra
Cons.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 bool_const0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Cons.head:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Cons.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 16($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
Cons.init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	lw	$a0 4($fp)
	sw	$a0 12($s0)
	lw	$a0 0($fp)
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra
A2I.c2i:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	lw	$s1 8($fp)
	la	$t2 str_const11
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label59
	la	$a1 bool_const0
	jal	equality_test
label59:
	lw	$t1 12($a0)
	beqz	$t1 label57
	la	$a0 int_const0
	b	label58
label57:
	lw	$s1 8($fp)
	la	$t2 str_const12
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label62
	la	$a1 bool_const0
	jal	equality_test
label62:
	lw	$t1 12($a0)
	beqz	$t1 label60
	la	$a0 int_const1
	b	label61
label60:
	lw	$s1 8($fp)
	la	$t2 str_const13
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label65
	la	$a1 bool_const0
	jal	equality_test
label65:
	lw	$t1 12($a0)
	beqz	$t1 label63
	la	$a0 int_const2
	b	label64
label63:
	lw	$s1 8($fp)
	la	$t2 str_const14
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label68
	la	$a1 bool_const0
	jal	equality_test
label68:
	lw	$t1 12($a0)
	beqz	$t1 label66
	la	$a0 int_const3
	b	label67
label66:
	lw	$s1 8($fp)
	la	$t2 str_const15
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label71
	la	$a1 bool_const0
	jal	equality_test
label71:
	lw	$t1 12($a0)
	beqz	$t1 label69
	la	$a0 int_const4
	b	label70
label69:
	lw	$s1 8($fp)
	la	$t2 str_const16
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label74
	la	$a1 bool_const0
	jal	equality_test
label74:
	lw	$t1 12($a0)
	beqz	$t1 label72
	la	$a0 int_const5
	b	label73
label72:
	lw	$s1 8($fp)
	la	$t2 str_const17
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label77
	la	$a1 bool_const0
	jal	equality_test
label77:
	lw	$t1 12($a0)
	beqz	$t1 label75
	la	$a0 int_const6
	b	label76
label75:
	lw	$s1 8($fp)
	la	$t2 str_const18
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label80
	la	$a1 bool_const0
	jal	equality_test
label80:
	lw	$t1 12($a0)
	beqz	$t1 label78
	la	$a0 int_const7
	b	label79
label78:
	lw	$s1 8($fp)
	la	$t2 str_const19
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label83
	la	$a1 bool_const0
	jal	equality_test
label83:
	lw	$t1 12($a0)
	beqz	$t1 label81
	la	$a0 int_const8
	b	label82
label81:
	lw	$s1 8($fp)
	la	$t2 str_const20
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label86
	la	$a1 bool_const0
	jal	equality_test
label86:
	lw	$t1 12($a0)
	beqz	$t1 label84
	la	$a0 int_const9
	b	label85
label84:
	la	$a0 str_const21
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label87
	la	$a0 str_const10
	li	$t1 26
	jal	_dispatch_abort
label87:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label88
	la	$a0 str_const10
	li	$t1 26
	jal	_dispatch_abort
label88:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$a0 $s0
	bne	$a0 $zero label89
	la	$a0 str_const10
	li	$t1 26
	jal	_dispatch_abort
label89:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	la	$a0 int_const0
label85:
label82:
label79:
label76:
label73:
label70:
label67:
label64:
label61:
label58:
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
A2I.i2c:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	lw	$s1 8($fp)
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label92
	la	$a1 bool_const0
	jal	equality_test
label92:
	lw	$t1 12($a0)
	beqz	$t1 label90
	la	$a0 str_const11
	b	label91
label90:
	lw	$s1 8($fp)
	la	$t2 int_const1
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label95
	la	$a1 bool_const0
	jal	equality_test
label95:
	lw	$t1 12($a0)
	beqz	$t1 label93
	la	$a0 str_const12
	b	label94
label93:
	lw	$s1 8($fp)
	la	$t2 int_const2
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label98
	la	$a1 bool_const0
	jal	equality_test
label98:
	lw	$t1 12($a0)
	beqz	$t1 label96
	la	$a0 str_const13
	b	label97
label96:
	lw	$s1 8($fp)
	la	$t2 int_const3
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label101
	la	$a1 bool_const0
	jal	equality_test
label101:
	lw	$t1 12($a0)
	beqz	$t1 label99
	la	$a0 str_const14
	b	label100
label99:
	lw	$s1 8($fp)
	la	$t2 int_const4
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label104
	la	$a1 bool_const0
	jal	equality_test
label104:
	lw	$t1 12($a0)
	beqz	$t1 label102
	la	$a0 str_const15
	b	label103
label102:
	lw	$s1 8($fp)
	la	$t2 int_const5
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label107
	la	$a1 bool_const0
	jal	equality_test
label107:
	lw	$t1 12($a0)
	beqz	$t1 label105
	la	$a0 str_const16
	b	label106
label105:
	lw	$s1 8($fp)
	la	$t2 int_const6
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label110
	la	$a1 bool_const0
	jal	equality_test
label110:
	lw	$t1 12($a0)
	beqz	$t1 label108
	la	$a0 str_const17
	b	label109
label108:
	lw	$s1 8($fp)
	la	$t2 int_const7
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label113
	la	$a1 bool_const0
	jal	equality_test
label113:
	lw	$t1 12($a0)
	beqz	$t1 label111
	la	$a0 str_const18
	b	label112
label111:
	lw	$s1 8($fp)
	la	$t2 int_const8
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label116
	la	$a1 bool_const0
	jal	equality_test
label116:
	lw	$t1 12($a0)
	beqz	$t1 label114
	la	$a0 str_const19
	b	label115
label114:
	lw	$s1 8($fp)
	la	$t2 int_const9
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label119
	la	$a1 bool_const0
	jal	equality_test
label119:
	lw	$t1 12($a0)
	beqz	$t1 label117
	la	$a0 str_const20
	b	label118
label117:
	move	$a0 $s0
	bne	$a0 $zero label120
	la	$a0 str_const10
	li	$t1 44
	jal	_dispatch_abort
label120:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr	$t1
	la	$a0 str_const1
label118:
label115:
label112:
label109:
label106:
label103:
label100:
label97:
label94:
label91:
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
A2I.a2i:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	lw	$a0 8($fp)
	bne	$a0 $zero label124
	la	$a0 str_const10
	li	$t1 57
	jal	_dispatch_abort
label124:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$s1 $a0
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label123
	la	$a1 bool_const0
	jal	equality_test
label123:
	lw	$t1 12($a0)
	beqz	$t1 label121
	la	$a0 int_const0
	b	label122
label121:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label128
	la	$a0 str_const10
	li	$t1 58
	jal	_dispatch_abort
label128:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	move	$s1 $a0
	la	$t2 str_const22
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label127
	la	$a1 bool_const0
	jal	equality_test
label127:
	lw	$t1 12($a0)
	beqz	$t1 label125
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label129
	la	$a0 str_const10
	li	$t1 58
	jal	_dispatch_abort
label129:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$s1 $a0
	la	$a0 int_const1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label130
	la	$a0 str_const10
	li	$t1 58
	jal	_dispatch_abort
label130:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label131
	la	$a0 str_const10
	li	$t1 58
	jal	_dispatch_abort
label131:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr	$t1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	b	label126
label125:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label135
	la	$a0 str_const10
	li	$t1 59
	jal	_dispatch_abort
label135:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	move	$s1 $a0
	la	$t2 str_const4
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label134
	la	$a1 bool_const0
	jal	equality_test
label134:
	lw	$t1 12($a0)
	beqz	$t1 label132
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label136
	la	$a0 str_const10
	li	$t1 59
	jal	_dispatch_abort
label136:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$s1 $a0
	la	$a0 int_const1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label137
	la	$a0 str_const10
	li	$t1 59
	jal	_dispatch_abort
label137:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label138
	la	$a0 str_const10
	li	$t1 59
	jal	_dispatch_abort
label138:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr	$t1
	b	label133
label132:
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label139
	la	$a0 str_const10
	li	$t1 61
	jal	_dispatch_abort
label139:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr	$t1
label133:
label126:
label122:
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
A2I.a2i_aux:
	addiu	$sp $sp -44
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 16($fp)
	sw	$s2 20($fp)
	sw	$s3 24($fp)
	sw	$s4 28($fp)
	la	$s1 int_const0
	lw	$a0 32($fp)
	bne	$a0 $zero label140
	la	$a0 str_const10
	li	$t1 71
	jal	_dispatch_abort
label140:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$s2 $a0
	la	$s3 int_const0
label141:
	move	$s4 $s3
	lw	$t1 12($s4)
	lw	$t2 12($s2)
	la	$a0 bool_const1
	blt	$t1 $t2 label143
	la	$a0 bool_const0
label143:
	lw	$t1 12($a0)
	beq	$t1 $zero label142
	move	$s4 $s1
	la	$a0 int_const10
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s4)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s4 $a0
	sw	$s3 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 32($fp)
	bne	$a0 $zero label144
	la	$a0 str_const10
	li	$t1 75
	jal	_dispatch_abort
label144:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label145
	la	$a0 str_const10
	li	$t1 75
	jal	_dispatch_abort
label145:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr	$t1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s4)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s1 $a0
	move	$s4 $s3
	la	$a0 int_const1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s4)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s3 $a0
	b	label141
label142:
	move	$a0 $zero
	move	$a0 $s1
	lw	$s1 16($fp)
	lw	$s2 20($fp)
	lw	$s3 24($fp)
	lw	$s4 28($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 48
	jr	$ra
A2I.i2a:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	lw	$s1 8($fp)
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label148
	la	$a1 bool_const0
	jal	equality_test
label148:
	lw	$t1 12($a0)
	beqz	$t1 label146
	la	$a0 str_const11
	b	label147
label146:
	la	$s1 int_const0
	lw	$a0 8($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label151
	la	$a0 bool_const0
label151:
	lw	$t1 12($a0)
	beqz	$t1 label149
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label152
	la	$a0 str_const10
	li	$t1 92
	jal	_dispatch_abort
label152:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr	$t1
	b	label150
label149:
	lw	$s1 8($fp)
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label153
	la	$a0 str_const10
	li	$t1 93
	jal	_dispatch_abort
label153:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const22
	bne	$a0 $zero label154
	la	$a0 str_const10
	li	$t1 94
	jal	_dispatch_abort
label154:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
label150:
label147:
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
A2I.i2a_aux:
	addiu	$sp $sp -36
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 12($fp)
	sw	$s2 16($fp)
	sw	$s3 20($fp)
	lw	$s1 24($fp)
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label157
	la	$a1 bool_const0
	jal	equality_test
label157:
	lw	$t1 12($a0)
	beqz	$t1 label155
	la	$a0 str_const1
	b	label156
label155:
	lw	$s1 24($fp)
	la	$a0 int_const10
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s1 $a0
	lw	$s2 24($fp)
	move	$s3 $s1
	la	$a0 int_const10
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s3)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s2)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label158
	la	$a0 str_const10
	li	$t1 103
	jal	_dispatch_abort
label158:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr	$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	sw	$s1 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label159
	la	$a0 str_const10
	li	$t1 103
	jal	_dispatch_abort
label159:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr	$t1
	bne	$a0 $zero label160
	la	$a0 str_const10
	li	$t1 104
	jal	_dispatch_abort
label160:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr	$t1
label156:
	lw	$s1 12($fp)
	lw	$s2 16($fp)
	lw	$s3 20($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 40
	jr	$ra
Main.main:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	la	$a0 StackMachine_protObj
	jal	Object.copy
	jal	StackMachine_init
	bne	$a0 $zero label161
	la	$a0 str_const9
	li	$t1 26
	jal	_dispatch_abort
label161:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr	$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra
StackMachine.read:
	addiu	$sp $sp -44
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 16($fp)
	sw	$s2 20($fp)
	sw	$s3 24($fp)
	sw	$s4 28($fp)
	la	$s1 str_const1
	la	$a0 Token_protObj
	jal	Object.copy
	jal	Token_init
	move	$s2 $a0
	la	$a0 List_protObj
	jal	Object.copy
	jal	List_init
	move	$s3 $a0
label162:
	move	$a0 $s2
	bne	$a0 $zero label166
	la	$a0 str_const0
	li	$t1 4
	jal	_dispatch_abort
label166:
	lw	$t1 8($a0)
	lw	$t1 4($t1)
	jalr	$t1
	move	$s4 $a0
	la	$t2 str_const2
	move	$t1 $s4
	la	$a0 bool_const1
	beq	$t1 $t2 label165
	la	$a1 bool_const0
	jal	equality_test
label165:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label164
	la	$a0 bool_const0
label164:
	lw	$t1 12($a0)
	beq	$t1 $zero label163
	la	$a0 str_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label167
	la	$a0 str_const0
	li	$t1 5
	jal	_dispatch_abort
label167:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr	$t1
	move	$a0 $s0
	bne	$a0 $zero label168
	la	$a0 str_const0
	li	$t1 6
	jal	_dispatch_abort
label168:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr	$t1
	move	$s1 $a0
	sw	$s1 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label169
	la	$a0 str_const0
	li	$t1 7
	jal	_dispatch_abort
label169:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr	$t1
	move	$s2 $a0
	sw	$s3 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s2
	bne	$a0 $zero label170
	la	$a0 str_const0
	li	$t1 8
	jal	_dispatch_abort
label170:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr	$t1
	move	$s3 $a0
	b	label162
label163:
	move	$a0 $zero
	lw	$s1 16($fp)
	lw	$s2 20($fp)
	lw	$s3 24($fp)
	lw	$s4 28($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 44
	jr	$ra
StackMachine.scan:
	addiu	$sp $sp -20
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 16
	move	$s0 $a0
	sw	$s1 4($fp)
	lw	$s1 8($fp)
	la	$t2 str_const4
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label173
	la	$a1 bool_const0
	jal	equality_test
label173:
	lw	$t1 12($a0)
	beqz	$t1 label171
	la	$a0 Plus_protObj
	jal	Object.copy
	jal	Plus_init
	b	label172
label171:
	lw	$s1 8($fp)
	la	$t2 str_const5
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label176
	la	$a1 bool_const0
	jal	equality_test
label176:
	lw	$t1 12($a0)
	beqz	$t1 label174
	la	$a0 Exchanger_protObj
	jal	Object.copy
	jal	Exchanger_init
	b	label175
label174:
	lw	$s1 8($fp)
	la	$t2 str_const6
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label179
	la	$a1 bool_const0
	jal	equality_test
label179:
	lw	$t1 12($a0)
	beqz	$t1 label177
	la	$a0 Evaluation_protObj
	jal	Object.copy
	jal	Evaluation_init
	b	label178
label177:
	lw	$s1 8($fp)
	la	$t2 str_const7
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label182
	la	$a1 bool_const0
	jal	equality_test
label182:
	lw	$t1 12($a0)
	beqz	$t1 label180
	la	$a0 Displaying_protObj
	jal	Object.copy
	jal	Displaying_init
	b	label181
label180:
	lw	$s1 8($fp)
	la	$t2 str_const8
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label185
	la	$a1 bool_const0
	jal	equality_test
label185:
	lw	$t1 12($a0)
	beqz	$t1 label183
	la	$a0 Stopping_protObj
	jal	Object.copy
	jal	Stopping_init
	b	label184
label183:
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Number_protObj
	jal	Object.copy
	jal	Number_init
	bne	$a0 $zero label186
	la	$a0 str_const0
	li	$t1 19
	jal	_dispatch_abort
label186:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr	$t1
label184:
label181:
label178:
label175:
label172:
	lw	$s1 4($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 24
	jr	$ra
