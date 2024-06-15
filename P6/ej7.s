        .data
CONTROL: .word32 0x10000
   DATA: .word32 0x10008
msj1:   .asciiz "Ingrese un numero:"
color:  .byte 0,0,0,0   ;color negro
        .text
        LWU $s0,CONTROL($0)
        LWU $s1,DATA($0)

        DADDI $t0,$0,msj1
        SD $t0,0($s1)
        DADDI $t0,$0,4
        SD $t0,0($s0)
        DADDI $t0,$0,9
        SD $t0,0($s0)       ;solicito ingreso de caracter
        LB $s2,0($s1)       ;lo guardo en $s2
        DADDI $t1,$0,0x30
        DSUB $s2,$s2,$t1   ;ASCII a decimal
        
        LB $t0,color($0)
        SB $t0,0($s1)

        DADDI $t1,$0,1
        BEQ $s2,$t1,uno
        DADDI $t1,$0,2
        BEQ $s2,$t1,dos
        DADDI $t1,$0,3
        BEQ $s2,$t1,tres
        DADDI $t1,$0,4
        BEQ $s2,$t1,cuatro
        DADDI $t1,$0,5
        BEQ $s2,$t1,cinco
        DADDI $t1,$0,6
        BEQ $s2,$t1,seis
        DADDI $t1,$0,7
        BEQ $s2,$t1,siete
        DADDI $t1,$0,8
        BEQ $s2,$t1,ocho
        DADDI $t1,$0,9
        BEQ $s2,$t1,nueve
        J fin

   uno:         ;-UNO-
        DADDI $a1,$0,3      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,3      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        DADDI $a3,$0,2     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,4      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,7     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        j fin
        ;-DOS
 dos:   DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,3      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH

        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,2      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
  diag: SB $a2,4($s1)       
        SB $a1,5($s1)
        DADDI $t0,$0,5
        SB $t0,0($s0)
        DADDI $a1,$a1,1
        DADDI $a2,$a2,1
        DADDI $a3,$a3,-1
        BNEZ $a3,diag
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        SB $a2,4($s1)       
        SB $a1,5($s1)
        DADDI $t0,$0,5
        SB $t0,0($s0)
        j fin
        ;-TRES
 tres:  DADDI $a1,$0,3      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,3      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,4      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,2     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,6      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        DADDI $t0,$0,5
        SB $t0,0($s0)
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,2      ;$a2=y
        DADDI $t0,$0,5
        SB $t0,0($s0)
        j fin
        ;-CUATRO
cuatro: DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,5      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        DADDI $a3,$0,6     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        j fin
        ;-CINCO
cinco:  DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,6      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        j fin
        ;-SEIS
seis:   DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,5     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,7     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,6      ;$a1=x
        DADDI $a2,$0,3      ;$a2=y
        DADDI $a3,$0,2     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        j fin
        ;-SIETE
 siete: DADDI $a1,$0,1      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,4      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        DADDI $a3,$0,6     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        j fin
            ;-OCHO-
  ocho:  DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,5      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,8      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,1      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,2     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,5      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,2     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,1      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,5      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,3     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        J fin
        ;-NUEVE
    nueve:
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,4      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,1      ;$a2=y
        DADDI $a3,$0,4     ;$a3=cantidad de pixeles a pintar
        JAL lineaH
        DADDI $a1,$0,2      ;$a1=x
        DADDI $a2,$0,6      ;$a2=y
        DADDI $a3,$0,2     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
        DADDI $a1,$0,6      ;$a1=x
        DADDI $a2,$0,7      ;$a2=y
        DADDI $a3,$0,7     ;$a3=cantidad de pixeles a pintar
        JAL lineaV
fin:
        HALT

lineaH: ;$a1=X $a2=Y $a3=cantidad
        ;de izquierda a derecha
        SB $a2,4($s1)       
loopH:   SB $a1,5($s1)
        DADDI $t0,$0,5
        SB $t0,0($s0)
        DADDI $a1,$a1,1
        DADDI $a3,$a3,-1
        BNEZ $a3,loopH
        JR $ra
lineaV: ;$a1=X $a2=Y $a3=cantidad
        ;de arriba a abajo
        SB $a1,5($s1)       
loopV:   SB $a2,4($s1)
        DADDI $t0,$0,5
        SB $t0,0($s0)
        DADDI $a2,$a2,-1
        DADDI $a3,$a3,-1
        BNEZ $a3,loopV
        JR $ra