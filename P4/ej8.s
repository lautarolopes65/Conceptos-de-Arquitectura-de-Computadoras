.data
	numA: .word 2
	numB: .word 10
	res: .word 0
.code
	ld r1,numA(r0)
	ld r2,numB(r0)
	dadd r3,r0,r0
loop:	daddi r2,r2,-1
	bnez r2,loop
	dadd r3,r3,r1
	
	sd r3,res(r0)
	halt