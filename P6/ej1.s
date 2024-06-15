	.data
texto: .byte 0 
CONTROL: .word32 0x10000
DATA: 	.word32 0x10008
	.text
	lwu $s0, DATA(r0) ; $s0 = dirección de DATA
	lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL
	dadd $s5,$0,$0 ; para desplazarme en el string
	daddi $s6,$0,13 ; ASCII del caracter para terminar de leer
	daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
	sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla

loop:	daddi $t0, $0, 9 ; $t0 = 9 ->ingreso caracter
	sd $t0, 0($s1) ; CONTROL recibe 9 y espera el ingreso de un caracter
	lb $s3,0($s0)
	beq $s3,$s6,fin
	sb $s3,texto($s5)
	daddi $s5,$s5,1
	j loop
fin:	daddi $s4,$0,texto
	sd $s4,0($s0)
	daddi $t0,$0,4
	sd $t0,0($s1)
	halt