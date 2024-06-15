            .data
CONTROL:    .word32 0x10000
   DATA:    .word32 0x10008
msj1:       .asciiz "Ingrese una base(nro flotante):"
msj2:       .asciiz "Ingrese un exponente(nro entero positivo):"
msj3:       .asciiz "Potencia = "
            .text
            LWU $s0,CONTROL($0)
            LWU $s1,DATA($0)
            DADDI $t0,$0,msj1
            SD $t0,0($s1)
            DADDI $t0,$0,4
            SD $t0,0($s0)       ;imprimir 1er msj
            DADDI $t0,$0,8
            SD $t0,0($s0)       ;solicito nro flotante
            L.D f1,0($s1)        ;lo cargo en f1
            MFC1 $a0,f1          ;copio los 64 bits de f1 a $a0
            DADDI $t0,$0,msj2
            SD $t0,0($s1)
            DADDI $t0,$0,4
            SD $t0,0($s0)       ;imprimir 2do msj
            DADDI $t0,$0,8
            SD $t0,0($s0)       ;solicito nro entero
            LD $a1,0($s1)       ;lo cargo en $a1

            JAL a_la_potencia

            HALT

a_la_potencia:  DADDI $t1,$0,1
                MTC1 $t1,f2
                CVT.D.L f2,f2 
                BEQZ $a1,fin        ;si exp=0 devuelvo 1
                MTC1 $a0,f1
        loop:   BEQZ $a1,fin
                MUL.D f2,f2,f1 
                DADDI $a1,$a1,-1
                J loop 
                j fin
         fin:   DADDI $t0,$0,msj3
                SD $t0,($s1)
                DADDI $t0,$0,4
                SD $t0,0($s0)       ;imprimir 3er msj
                S.D f2,0($s1)
                DADDI $t0,$0,3
                SD $t0,0($s0)       ;imprimo resultado
                JR $ra