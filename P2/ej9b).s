PA EQU 30
PB EQU 31h
CA EQU 32h
CB EQU 33h


ORG 1000H
 CADENA DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
 fin db?

 
ORG 2000H
 MOV BX,OFFSET CADENA
 MOV AH,OFFSET fin-OFFSET CADENA
 MOV AL, 01h; ; STROBE SALIDA (0), BUSY ENTRADA (1), RESTO EN 0
 OUT CA, AL
 MOV AL, 0 ;PUERTO DE DATOS, TODO SALIDA
 OUT CB, AL
LOOP:
 ; inicializo strobe en 
 IN AL, PA
 AND AL, 0FDh ; 1111 1101b
 OUT PA, AL

 

 ; espero que busy=0
 POLL: IN AL, PA
 AND AL, 01h ;0000 0001b
 JNZ POLL

 

 ; se que busy es 0, mandar carácter
 MOV AL,BYTE PTR [BX]
 OUT PB, AL
 

 ; mandar flanco ascendente de strobe

 IN AL, PA
 OR AL, 02h; 00000010b
 OUT PA, AL

 
 INC BX
 DEC AH
 CMP AH,0
 JNZ LOOP
 INT 0
END