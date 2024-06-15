	.data
CONTROL: .word32 0x10000
DATA:	.word32 0x10008
num1:	.word 0
num2:	.word 0
result:	.word 0
msj:	.asciiz "Ingrese un numero:"
msj1:	.asciiz "Suma="
	.code
	LWU $s0,DATA($0)
	LWU $s1,CONTROL($0)
	JAL ingreso
	LD $a0,num1($0)
	LD $a1,num2($0)
	JAL resultado
	SD $v0,result($0)
	HALT

resultado: DADDI $t0,$0,6
	SD $t0,0($s1)	;limpio pantalla alfanumerica
	DADDI $t0,$0,msj1
	SD $t0,0($s0)	;guardo msj en DATA
	DADDI $t0,$0,4
	SD $t0,0($s1)	;imprimir
	;-hexa a decimal
	daddi $t1,$0,0x30
	dsubu $a0,$a0,$t1
	dsubu $a1,$a1,$t1
	DADD $v0,$a0,$a1 ;suma
	SD $v0,0($s0)	;guardo suma en DATA
	DADDI $t0,$0,1	
	SD $t0,0($s1)	;imprimo suma
	JR $ra

ingreso:	daddi $s2,$0,1
	daddi $t0,$0,6
	sd $t0,0($s1)	;limpio pantalla alfanumerica
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
	sd $t1,num1($0)	;lo guardo en memoria
	;-segundo numero-
	daddi $s2,$0,1
	daddi $t0,$0,6
	sd $t0,0($s1)	;limpio pantalla alfanumerica
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
	sd $t1,num2($0)	;lo guardo en memoria
	jr $ra