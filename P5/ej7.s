	.data
M:	.word 5
tabla:	.word 2,5,3,7,8,4,9
long:	.word 7
result:	.word 0
    	.text
	ld $a0,M(r0)
	daddi $a1,$0,tabla
	ld $a2,long(r0)
	jal valoresMayores
	sd $v0,result(r0)
	halt
valoresMayores:	dadd $v0,$0,$0
	loop:	dadd $t1,$0,$0
		ld $t2,0($a1)
		slt $t1,$a0,$t2	;$t1=1 si M<vtabla
		beqz $t1,sigo
		dadd $v0,$v0,$t1
	sigo:	daddi $a1,$a1,8
		daddi $a2,$a2,-1
		bnez $a2,loop
		jr $ra
		