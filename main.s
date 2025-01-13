.global _start
.equ DISPLAY_ADDRESS, 0xff200020
.equ SENTINEL, 0xaaaaaaaa

_start:
	LDR r0,=DISPLAY_ADDRESS
	LDR r1,=PATTERNS
	//LDR r2,=SENTINEL
	
	LDR r3,[r1]
	STR r3,[r0]
	BAL loop
	
loop:
	LDR r3,[r1,#4]!
	
	//CMP r3,[r2]
	//BEQ end
    
	STR r3,[r0,#4]!
	BAL loop

end:
MOV r7,#1
MOV r0,#0
SWI 0

.section .data

PATTERNS:
	.word 0x3f, 0x8, 0x8, 0x79, 0x76