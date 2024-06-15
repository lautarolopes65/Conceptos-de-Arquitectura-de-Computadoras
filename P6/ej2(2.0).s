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
	ld $a0,num($0)
	daddi $a1,$0,str0
	jal muestra
	halt
	
ingreso:	
	daddi $s2,$0,1
	daddi $t0,$0,6
	sd $t0,0($s1)
	;-imprimo mensaje-
	daddi $t0,$0,msj
	sd $t0,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	;-leo caracter hasta que se ingrese un numero-
leer:	dadd $t2,$0,$0
	daddi $t0,$0,9
	sd $t0,0($s1)
	ld $t1,0($s0)
	slti $t2,$t1,0x30
	beq $t2,$s2,leer	;si es 1, no es un digito
	slti $t2,$t1,0x39
	bne $t2,$s2,leer	;si es 1, es un digito
	sd $t1,num($0)	;lo guardo en memoria
	jr $ra
	
muestra:	daddi $t0,$0,6
	sd $t0,0($s1)
	daddi $t1,$0,0x30
loop:	beq $a0,$t1,imprimir
	daddi $a1,$a1,8
	daddi $t1,$t1,1
	j loop
imprimir:	sd $a1,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
jfin:	jr $ra