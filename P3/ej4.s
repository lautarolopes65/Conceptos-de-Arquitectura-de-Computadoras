EOI EQU 20H 
IMR EQU 21H
INT0 EQU 24H
N_F10 EQU 15 

ORG 60
IP_F10 DW RUT_F10

ORG 1000H
msj db "Vamos las interrupciones!"
finmsj db ?
contador db 5
salto db 10
ORG 3000H 
RUT_F10:
  PUSH AX 
  PUSH BX
  MOV BX,OFFSET msj
  MOV AL,OFFSET finmsj-OFFSET msj
  INT 7
  MOV BX,OFFSET salto
  MOV AL,1
  INT 7
  DEC contador
  CMP contador,0
  JNZ sigo
  MOV AL,0FFH  ; deshabilito todas las interrupciones
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
  MOV AL, 0FEH 
  OUT IMR,AL
  MOV AL,N_F10
  OUT INT0, AL
STI 
LAZO:JMP LAZO
 INT 0
END