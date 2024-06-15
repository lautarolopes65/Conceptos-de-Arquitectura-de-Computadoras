        .data
msjx:   .asciiz "x="
msjy:   .asciiz "y="
msjR:   .asciiz "R="
msjG:   .asciiz "G="
msjB:   .asciiz "B="
coorX:  .byte 0 ; coordenada X de un punto
coorY:  .byte 0 ; coordenada Y de un punto
color:  .byte 0, 0, 0, 0 
CONTROL: .word32 0x10000
DATA:   .word32 0x10008
        .text
        lwu $s6, CONTROL(r0)        ; $s6 = dirección de CONTROL
        lwu $s7, DATA(r0)           ; $s7 = dirección de DATA
        daddi $t0, $0, 7            ; $t0 = 7 -> función 7: limpiar pantalla gráfica
        sd $t0, 0($s6)              ; CONTROL recibe 7 y limpia la pantalla gráfica
        
        DADDI $t0,$0,msjx
        SD $t0,0($s7)
        DADDI $t0,$0,4
        SD $t0,0($s6)               ;imprimo msjx
        DADDI $t0,$0,8
        SD $t0,0($s6)               ; solicito coordenada x
        lbu $s0,0($s7)              ; $s0 = valor de coordenada X
        sb $s0,coorX($0)           
        DADDI $t0,$0,msjy
        SD $t0,0($s7)
        DADDI $t0,$0,4
        SD $t0,0($s6)               ;imprimo msjy
        DADDI $t0,$0,8          
        SD $t0,0($s6)               ; solicito coordenada y
        lbu $s1,0($s7)              ; $s1 = valor de coordenada Y
        sb $s1,coorY($0)              

        
        DADDI $t0,$0,msjR
        SD $t0,0($s7)
        DADDI $t0,$0,4
        SD $t0,0($s6)               ;imprimo msjR
        DADDI $t0,$0,8          
        SD $t0,0($s6)               ; solicito color rojo
        LBU $t1,0($s7)
        DADD $s3,$0,$0
        SB $t1,color($s3)
        DADDI $t0,$0,msjG
        SD $t0,0($s7)
        DADDI $t0,$0,4
        SD $t0,0($s6)               ;imprimo msjG
        DADDI $t0,$0,8          
        SD $t0,0($s6)               ; solicito color verde
        LBU $t2,0($s7)
        DADDI $s3,$s3,1
        SB $t2,color($s3)
        DADDI $t0,$0,msjB
        SD $t0,0($s7)
        DADDI $t0,$0,4
        SD $t0,0($s6)               ;imprimo msjB
        DADDI $t0,$0,8          
        SD $t0,0($s6)               ; solicito color azul
        LBU $t3,0($s7)
        DADDI $s3,$s3,1
        SB $t3,color($s3)

        
        SB $s0,5($s7)               ; DATA+5 recibe el valor de coordenada X
        SB $s1,4($s7)               ; DATA+4 recibe el valor de coordenada Y
        lwu $s2, color(r0)          ; $s2 = valor de color a pintar
        sw $s2, 0($s7)              ; DATA recibe el valor del color a pintar
        daddi $t0, $0, 5            ; $t0 = 5 -> función 5: salida gráfica
        sd $t0, 0($s6)              ; CONTROL recibe 5 y produce el dibujo del punto
        halt