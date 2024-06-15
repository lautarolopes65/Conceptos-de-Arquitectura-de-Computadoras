.data
	x: .word 2
	y: .word 2
	a: .word 5
.code			;45 ciclos,28 inst.,1.607 CPI
	ld r1,x(r0)	;2 RAW,11 Branch Taken
	ld r2,y(r0)
	ld r3,a(r0)
	
while:	bnez r3,loop
	j fin
loop:	dadd r1,r1,r2
	daddi r3,r3,-1
	j while
fin:	sd r1,x(r0)
	sd r3,a(r0)
	halt