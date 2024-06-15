    .data
valor:    .word 5
result:    .word 0
    .text
    daddi $sp,$0,0x400
    ld $a0,valor($0)
    jal factorial
    sd $v0,result($0)
    halt

factorial:    daddi $sp,$sp,-16
        sd $ra,0($sp)
        sd $s0,8($sp)
        
        beqz $a0,fin_recur
        dadd $s0,$0,$a0
        daddi $a0,$a0,-1
        jal factorial
        dmul $v0,$v0,$s0
        j fin
  fin_recur:    daddi $v0,$0,1
    
    fin:    ld $s0,8($sp)
        ld $ra,0($sp)
        daddi $sp,$sp,16
        jr $ra