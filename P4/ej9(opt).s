.data
	x: .word 2
	y: .word 2
	a: .word 5
.code			;36 ciclos,32 inst.,1.125 CPI
	ld r3,a(r0)	;
	ld r1,x(r0)
	ld r2,y(r0)
	
while:	beqz r3,fin
loop:	sd r1,x(r0)
	daddi r3,r3,-1
	j while
	dadd r1,r1,r2
fin:
	sd r3,a(r0)
	halt