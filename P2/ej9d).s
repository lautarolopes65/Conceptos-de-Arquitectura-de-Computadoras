EOI EQU 20h
IMR EQU 21h
INT0 EQU 24h
PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 1000H
  flag db 0
  cadena db ?
ORG 3000H
RUT_F10:
  mov flag,1
  MOV AL,20H
  OUT EOI,AL
IRET
ORG 2000H
  MOV AX,RUT_F10
  MOV BX,40 ; 10 * 4 = 40 en vect. de interrucpciones
  MOV [BX],AX ; en la posicion 40 = 3000h
  
  MOV BX,OFFSET cadena
  MOV AH,0
  ; CONFIGURO PIO
  MOV AL, 01h; ; strobe en salida (0), busy en entrada (1), resto en 0
  OUT CA, AL
  MOV AL, 0 ; puerto de datos, todo salida
  OUT CB, AL
  
  ; CONFIGURO PIC
  CLI
  MOV AL,11111110b ; habilito la int. F10
  OUT IMR,AL
  MOV AL,10  ; asigno id = 10
  OUT INT0,AL
  STI
  ; leo caracteres hasta apretar F10
LOOP:
  INT 6
  INC BX
  INC AH
  CMP FLAG,0
  JZ LOOP
 ; mando el principio de la cadena a BX
  MOV BX,OFFSET cadena
 ; espero que busy=0
POLL: 
  IN AL, PA
  AND AL, 01h ;0000 0001b
  JNZ POLL
 ; se que busy es 0, mandar carácter
  MOV AL,BYTE PTR [BX]
  OUT PB, AL
  
 ; mandar flanco descendente de strobe s = 0
  IN AL, PA
  AND AL, 0FDh ; 1111 1101b
  OUT PA, AL
 ; mandar flanco ascendente de strobe s = 1
  IN AL, PA
  OR AL, 02h; 00000010b
  OUT PA, AL

  INC BX
  DEC AH
  CMP AH,0
  JNZ POLL
 
 INT 0
END