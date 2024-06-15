PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
COMP EQU 11H
ORG 2000h
  mov al,11111111b
  out CA,al ;CA=11111111
  mov al,00000000b
  out CB,al ;CB=00000000
  mov al,0Ah
  out COMP,al
loop:
  in al,PA
  out PB,al
  jmp loop
fin:int 0
end