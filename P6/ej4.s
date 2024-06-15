            .data
CONTROL:    .word32 0x10000
DATA:       .word32 0X10008
cadena:     .byte 0
clave:      .asciiz "goku"
msj1:       .asciiz "Ingrese clave:"
msj2:       .asciiz "Bienvenido"
msj3:       .asciiz "ERROR"

            .text
            LW $s0,CONTROL($s0)
            LW $s1,DATA($s1)
            DADDI $t0,$0,msj1
            SD $t0,0($s1)
            DADDI $t0,$0,4
            SD $t0,0($s0)           ;imprimo mensaje de ingreso
            DADDI $s4,$0,4          ;cantidad de caracteres a leer
            DADD $t1,$0,$0          ;reg. para desplazamiento en cadena
        ;--lectura de cadena    
loop:       JAL char
            SB $v0,cadena($t1)
            DADDI $t1,$t1,1
            DADDI $s4,$s4,-1
            BNEZ $s4,loop
        ;--comparacion de Strings--
            DADD $t1,$0,$0          ;reg. para desplazamiento en cadena
            DADDI $s4,$0,4          ;cantidad de caracteres
comp:       LB $t2,cadena($t1)
            LB $t3,clave($t1)
            BNE $t2,$t3,err
            DADDI $s4,$s4,-1
            DADDI $t1,$t1,1
            BNEZ $s4,comp
            J fin
    err:    DADDI $a0,$a0,1
    fin:    JAL respuesta
            HALT
    ;--lee caracter y lo devuelve en $v0--
char:       DADDI $t0,$0,9
            SD $t0,0($s0)
            LB $v0,0($s1)
            JR $ra

respuesta:  DADDI $t0,$0,6
            SD $t0,0($s0)
            BNEZ $a0,error          ;si $a0=1 los strings son diferentes
            ;--Imprimo "Bienvenida"
            DADDI $t0,$0,msj2
            SD $t0,0($s1)
            DADDI $t0,$0,4
            SD $t0,0($s0)
            j finSub
            ;--Imprimo "ERROR"
    error:  DADDI $t0,$0,msj3
            SD $t0,0($s1)
            DADDI $t0,$0,4
            SD $t0,0($s0)
    finSub: JR $ra