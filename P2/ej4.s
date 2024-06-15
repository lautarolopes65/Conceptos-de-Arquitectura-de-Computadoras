ORG 1000H
msj DB "xx elefantes se balanceaban"
fin2 DB ?
x DB 30h
y DB 30h
cant db 100
salto db 10
ORG 3000H
PRINT: 
    MOV DH,0
    MOV DL,cant
loop:
    MOV msj,CH
    MOV msj+1,CL
    MOV BX, OFFSET msj
    MOV AL, OFFSET fin2-OFFSET msj
    INT 7
    MOV BX, OFFSET salto
    MOV AL,1
    INT 7
    CMP CL,39h
    JNZ salto1
    INC CH
    MOV CL,30h
    JMP salto2
salto1:
    INC CL
salto2:INC DH
    CMP DH,DL
    JNZ loop
    
ret
ORG 2000H
MOV CH,x
MOV CL,y
call PRINT
INT 0
END