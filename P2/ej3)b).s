ORG 1000H
inicio DW 41h
fin DW 5Ah
ORG 2000H
MOV DX,inicio
MOV AL,1
MOV CX,fin

loop: MOV BX, OFFSET inicio
      INT 7
      INC word ptr[BX]
      CMP word ptr[BX],CX
      JNZ loop
      MOV BX, OFFSET inicio
      INT 7
INT 0
END