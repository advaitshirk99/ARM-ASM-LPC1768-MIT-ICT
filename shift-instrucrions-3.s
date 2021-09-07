; Shift Instructions: LSL, LSR, ASR
; Flags are not affected 
; Use 'S' Suffix to update teh flag

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
	LDR R2, =0xA0000030
	
	; Arithmetic Shift Right by 2 Bits
	; R2 = Unchanged and 
	; R0  = [R2] Shifted by 2 bits Right, extending sign bit
	MOV R0, R2, ASR #2 
	
	; Guess the output, 4-bits means 1 digit
	LDR R1, =0x81223344
	MOV R6, R1, ASR #4
	MOV R7, R1, ASR #8
	MOV R8, R1, ASR #16
	MOVS R9, R1, ASR #32
	
	NOP
	END