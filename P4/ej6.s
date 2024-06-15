.data
A: .word 1
B: .word 1
C: .word 1
D: .word 0
	.code
	ld r1,A(r0)
	ld r2,B(r0)
	ld r3,C(r0)
	dadd r4,r0,r0

	bne r1,r2,sigo
	daddi r4,r4,2
	bne r1,r3,sigo1
	daddi r4,r4,1
	j fin

sigo:	bne r1,r3,fin
	daddi r4,r4,2
	bne r3,r2,fin
	daddi r4,r4,1
	j fin

sigo1:	bne r2,r3,fin
	daddi r4,r4,2

fin:	sd r4,D(r0)
	halt
	
	