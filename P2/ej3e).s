ORG 1000H
inicio DB 41h
fin DB 5Ah
salto DB 10

ORG 2000H

MOV AL,1
MOV CL,fin

loop: 
      MOV BX, OFFSET inicio
      INT 7
      MOV BX, OFFSET inicio
      ADD byte ptr[BX],20h
      INT 7
      SUB byte ptr[BX],20h
      INC byte ptr[BX]
      CMP byte ptr[BX],CL
      JNZ loop
      MOV BX, OFFSET inicio
      INT 7
      ADD byte ptr[BX],20h
      INT 7
INT 0
END