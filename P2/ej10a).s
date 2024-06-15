HAND_DATO EQU 40h
HAND_ESTADO EQU 41h

ORG 1000H
  cadena db "INGENIERIA E INFORMATICA"
  fin db ?
ORG 2000H
  ; configuro el handshake en polling
  IN AL,HAND_ESTADO
  AND AL,07FH  ; 41h = 0xxxxxxxxb
  OUT HAND_ESTADO,AL

  MOV BX,OFFSET cadena
POLL:
  IN AL,HAND_ESTADO
  AND AL,1
  JNZ POLL
  MOV AL,[BX]
  OUT HAND_DATO,AL
  INC BX
  CMP BX,OFFSET fin
  JNZ POLL
 INT 0
END