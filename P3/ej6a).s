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
msj db "Ingresar valor entre 1 y 9:"
finmsj db ?
valor db ?
salto db 10
INICIO db 0

ORG 3500H
RUT_TIMER:
  PUSH AX 
  PUSH BX
  MOV AL,1
  
  INT 7
  DEC valor
  CMP valor,30H-1
  JNZ sigo

  MOV AL,0FFH
  OUT IMR,AL
  MOV DL,1
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
  MOV AL,0FCH ; 1111 1100
  OUT IMR,AL  ; habilito timer
  
  MOV AL,EOI
  OUT EOI,AL
  POP AX
IRET
ORG 2000H 
; Configuro la PIC
CLI 
  MOV AL, 0FEH ; habilito tecla F10
  OUT IMR,AL  ;IMR = 1111 1110
  MOV AL,N_TIMER
  OUT INT1,AL ; id timer
  MOV AL,N_F10
  OUT INT0,AL ; id F10
  MOV AL,0 ; inicializo CONT
  OUT CONT,AL
  MOV AL,1
  OUT COMP,AL
STI 

  MOV BX,OFFSET msj
  MOV AL,OFFSET finmsj-OFFSET msj
  INT 7
  MOV BX,OFFSET valor
  MOV AL,1
  INT 6
  MOV DL,0
LAZO:
  CMP DL,0
  JZ LAZO
 INT 0
END