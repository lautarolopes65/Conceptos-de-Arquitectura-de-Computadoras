.data
	TABLA: .word 2,6,1,4,8,5,3,10,7,9
	long: .word 10
	X: .word 5
	CANT: .word 0
	RES: .word 0
.code
	ld r4,X(r0)	;r4=X
	dadd r1,r0,r0
	ld r2, long(r0)
	dadd r6,r0,r0	;r6=CANT
loop:	dadd r5,r0,r0
	ld r3,TABLA(r1)
	slt r5,r4,r3	;r5=1 si r4<r3
	sd r5,RES(r1)
	dadd r6,r6,r5	
	daddi r2,r2,-1
	daddi r1,r1,8	
	bnez r2,loop

	sd r6,CANT(r0)
	halt