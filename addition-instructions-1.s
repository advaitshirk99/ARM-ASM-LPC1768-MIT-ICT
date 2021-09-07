// Program to perform Addition, subtraction, multiplication and division based on condition 1 =ass, 2= sub, 3 = sub, 4 = mul.


	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler

	LDR R1, =0X10000000
	LDR R2, [R1]    ; CONDITION
	LDR R3, [R1,#4] ;1ST NUMBER
	LDR R4, [R1,#8] ; 2ND NUMBER
	
	CMP R2, #01
	BNE CHK_SUB
	ADD R5, R3, R4
	B LAST
	
	
CHK_SUB	CMP R2, #02
	BNE CHK_MUL
	SUB R5, R3, R4
	B LAST 

CHK_MUL	CMP R2, #03
	BNE CHK_DIV
	MUL R5, R3, R4
	B LAST
	
CHK_DIV	CMP R2, #04
	BNE DEFULT
	UDIV R5, R3, R4
	B LAST

DEFULT MOV R5, #0

LAST STR R5, [R1, #0XC]  ; 

	NOP
	END