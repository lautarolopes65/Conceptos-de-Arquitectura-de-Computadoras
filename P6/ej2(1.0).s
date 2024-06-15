	.data
CONTROL: .word32 0x10000
DATA:	.word32 0x10008
num:	.word 0
msj:	.asciiz "Ingrese un numero:"
str0:	.asciiz "CERO"
str1:	.asciiz "UNO"
str2:	.asciiz "DOS"
str3:	.asciiz "TRES"
str4:	.asciiz "CUATRO"
str5:	.asciiz "CINCO"
str6:	.asciiz "SEIS"
str7:	.asciiz "SIETE"
str8:	.asciiz "OCHO"
str9:	.asciiz "NUEVE"
	.text
	lwu $s0,DATA($0)
	lwu $s1,CONTROL($0)
	jal ingreso
	jal muestra
	halt
	
ingreso:	
	daddi $s2,$0,1
	daddi $t0,$0,6
	sd $t0,0($s1)
	daddi $t0,$0,msj
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
leer:	dadd $t2,$0,$0
	daddi $t0,$0,9
	sd $t0,0($s1)
	ld $t1,0($s0)
	slti $t2,$t1,48
	beq $t2,$s2,leer	;si es 1, no es un digito
	slti $t2,$t1,57
	bne $t2,$s2,leer	;si es 1, es un digito
	sd $t1,num($0)
	jr $ra
	
muestra:	daddi $t0,$0,6
	sd $t0,0($s1)
	daddi $t1,$0,48
	bne $a0,$t1,j1
	daddi $t0,$0,str0
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
j1:	daddi $t1,$0,49
	bne $a0,$t1,j2
	daddi $t0,$0,str1
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j2:	daddi $t1,$0,50
	bne $a0,$t1,j3
	daddi $t0,$0,str2
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j3:	daddi $t1,$0,51
	bne $a0,$t1,j4
	daddi $t0,$0,str3
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j4:	daddi $t1,$0,52
	bne $a0,$t1,j5
	daddi $t0,$0,str4
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j5:	daddi $t1,$0,53
	bne $a0,$t1,j6
	daddi $t0,$0,str5
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j6:	daddi $t1,$0,54
	bne $a0,$t1,j7
	daddi $t0,$0,str6
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j7:	daddi $t1,$0,55
	bne $a0,$t1,j8
	daddi $t0,$0,str7
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j8:	daddi $t1,$0,56
	bne $a0,$t1,j9
	daddi $t0,$0,str8
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	j jfin
j9:	daddi $t1,$0,57
	bne $a0,$t1,jfin
	daddi $t0,$0,str9
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
jfin:	jr $ra