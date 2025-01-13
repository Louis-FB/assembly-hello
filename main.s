.global _start
.equ DISPLAY_ADDRESS, 0xff200020

_start:
	LDR r0,=DISPLAY_ADDRESS // address of the displays
	LDR r1,=PATTERNS // pattern "array" location
	MOV r2,#4 // sentinel value (pattern length - 1)
	
	BAL loop
	
loop:
	LDR r3,[r1],#4 // set r3 as pattern val, then incr.
	
	STR r3,[r0],#4 // store pattern val in disp address memory, then incr.
	
	SUBS R2,R2,#1 // bounds check
	BNE loop // loop if not met

end:
MOV r7,#1
MOV r0,#0
SWI 0

.section .data
PATTERNS:
	.word 0x3f, 0x38, 0x38, 0x79, 0x76