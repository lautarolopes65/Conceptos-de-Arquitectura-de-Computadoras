EOI EQU 20H 
IMR EQU 21H
PIO EQU 30H

ORG 1000H
MSJ1 DB "Fin de Programa"
FIN1 DB ?
MSJ2 DB "Arquitectura de Computadoras: ACTIVADA"
FIN2 DB ?
FINALIZAR DB 0
ORG 3000H
caso_a:
  IN AL,PIO
  AND AL,0FFH ;AL=0->todas apagadas
  JNZ sigo
  MOV BX,OFFSET MSJ1
  MOV AL,OFFSET FIN1-OFFSET MSJ1
  INT 7
  MOV FINALIZAR,1
sigo:
  RET
caso_b:
  IN AL,PIO+1
  XOR AL,0FFH
  OUT PIO+1,AL
  RET
caso_c:
  IN AL,PIO
  AND AL,01H
  JZ noimprimo
  MOV BX,OFFSET MSJ2
  MOV AL,OFFSET FIN2-OFFSET MSJ2
  INT 7
noimprimo:
  RET
  
ORG 3500H
CONF_LUCES:
  MOV AL,0FFH
  OUT PIO+2,AL
  MOV AL,00H
  OUT PIO+3,AL
RET

ORG 2000H 
  CALL CONF_LUCES
  CALL caso_a
  CMP FINALIZAR,1
  JZ fin
  CALL caso_b
  CALL caso_c
fin:
 INT 0
END