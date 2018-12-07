.orig x3000

AND R0, R0, #0
AND R1, R1, #0
AND R4, R4, #0		;Clear R0 R1 and R4

	LD R0, ADDRESS		;R0 <--x4500

next 	LDR R1, R0, #0		;R1 <--400
	LDR R2, R0, #1		;R2 <--800
	BRZ END

	ADD R3, R1, R1		;R3 <--R1+R1
	NOT R3, R3		
	ADD R3, R3, #1		;R3 <--2's complement of R1+R1
	ADD R3, R2, R3		;R3 <--R2+R3 
	BRNP SKIP			
	ADD R4, R4, #1		;R4 <--R4+1
SKIP 	ADD R0, R0, #1		;R0 <--R0+1 (x4501)
	BR next

END	LD R0, ADDRESS		;R0 <--x4500	
	STR R4, R0, #-1		;R4 -->x4FFF



ADDRESS .FILL X4500
TRAP x25
.end

.ORIG X4500
.FILL X400
.FILL X800
.FILL X10
.FILL X20
.FILL X0

.END