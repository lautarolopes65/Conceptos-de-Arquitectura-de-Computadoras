EOI EQU 20H 
IMR EQU 21H
INT0 EQU 24H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

N_TIMER EQU 10 
N_F10 EQU 15 

ORG 40
IP_TIMER DW RUT_TIMER

ORG 60
IP_F10 DW RUT_F10

ORG 1000H
valor db 39H
salto db 10
PAUSA db 0H

ORG 3500H
RUT_TIMER:
  PUSH AX 
  PUSH BX
  MOV AL,1

  CMP PAUSA,0FFH ; si está en pausa
  JZ sigo
  
  INT 7
  DEC valor
  CMP valor,30H-1
  JNZ sigo

  MOV AL,0FEH
  OUT IMR,AL
  MOV valor,39H
  
sigo:  
  MOV AL,0 ; inicializo CONT, otra vez
  OUT CONT,AL
  MOV AL, EOI  ; aviso a la PIC que ya se atendió la interrupción
  OUT EOI,AL
  POP BX
  POP AX
IRET
ORG 3000H
RUT_F10:
  PUSH AX
  IN AL,IMR
  XOR AL,00000010b
  OUT IMR,AL  ; habilito/deshabilito timer
  
  CMP valor,39h
  JZ sigo1
  XOR PAUSA,0FFH 
sigo1:
  MOV AL,0
  OUT CONT,AL
  MOV AL,EOI
  OUT EOI,AL
  POP AX
IRET
ORG 2000H 
; Configuro la PIC
CLI 
  MOV AL, 0FCH ; habilito tecla F10
  OUT IMR,AL  ;IMR = 1111 1100
  MOV AL,N_TIMER
  OUT INT1,AL ; id timer
  MOV AL,N_F10
  OUT INT0,AL ; id F10
  MOV AL,0 ; inicializo CONT
  OUT CONT,AL
  MOV AL,1
  OUT COMP,AL
STI 
  MOV BX,OFFSET valor
  MOV DL,0
LAZO:
  CMP DL,0
  JZ LAZO
 INT 0
END