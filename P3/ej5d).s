EOI EQU 20H 
IMR EQU 21H
INT0 EQU 24H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

N_TIMER EQU 10 

ORG 40
IP_TIMER DW RUT_TIMER

ORG 1000H
msj db "Vamos las interrupciones!"
finmsj db ?
salto db 10
FINLOOP db 255
ORG 3000H 
RUT_TIMER:
  PUSH AX 
  PUSH BX
  MOV AL,0 ; inicializo CONT, otra vez
  OUT CONT,AL
  ; imprimo mensaje con un salto de linea
  MOV BX,OFFSET msj
  MOV AL,OFFSET finmsj-OFFSET msj
  INT 7
  MOV BX,OFFSET salto
  MOV AL,1
  INT 7
  ; incremento CONT
  IN AL,COMP
  INC AL
  OUT COMP,AL

  IN AL,COMP
  CMP AL,FINLOOP
  JNZ sigo
  MOV AL,0FFH
  OUT IMR,AL
sigo:
  MOV AL, EOI  ; aviso a la PIC que ya se atendió la interrupción
  OUT EOI,AL
  POP BX
  POP AX
  IRET
ORG 2000H 
; Configuro la PIC
CLI 
  MOV AL, 0FDH 
  OUT IMR,AL  ;IMR = 1111 1101
  MOV AL,N_TIMER
  OUT INT1,AL
  MOV AL,0 ; inicializo CONT
  OUT CONT,AL
  MOV AL,1 ; inicializo COMP
  OUT COMP,AL
STI 
LAZO:JMP LAZO
 INT 0
END