	.data
cadena1:	.asciiz "pedazo"
cadena2:	.asciiz "pelazo"
result:	.word 0
	.code
	daddi $a0,$0,cadena1
	daddi $a1,$0,cadena2
	jal comparar
	sd $v0,result(r0)
	halt

comparar:	dadd $t1,$a0,$0
		dadd $t2,$a1,$0
		daddi $t0,$0,1
	loop:	lb $a0,0($t1)
		lb $a1,0($t2)
		bne $a0,$a1,terminar
		daddi $t1,$t1,1
		daddi $t2,$t2,1
		daddi $t0,$t0,1
		bnez $a0,loop
		daddi $v0,$0,-1
		j fin
	terminar:	dadd $v0,$0,$t0
	fin:	jr $ra