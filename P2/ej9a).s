PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
ORG 1000h
char db "A"
ORG 2000h
  mov al,01h
  out CA,al ;CA=xxxxxx01b
  mov al,0
  out CB,al ;CB=00000000b

in al,PA
and al,11111101b
out PA,al

loop:
  in al,PA ;mientras b=1
  and al,01h
  jnz loop

mov al,char
out PB,al

in al,PA
or al,02h
out PA,al

fin:int 0
end