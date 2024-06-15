ORG 1000H
inicio DB 30h
fin DB 39h
salto DB 10
ORG 2000H
MOV DL,inicio
MOV AL,1
MOV CL,fin

loop: 
      MOV BX, OFFSET inicio
      INT 7
      INC byte ptr[BX]
      CMP byte ptr[BX],CL
      MOV BX, OFFSET salto
      INT 7
      JNZ loop
      MOV BX, OFFSET inicio
      INT 7
INT 0
END