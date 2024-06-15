ORG 3000h
msjtrue db "llave prendida"
msjfalse db "llave apagada"
finmsj2 db ?
ORG 2000h
  mov al,11111111b
  out 32h,al ;CA=11111111
  mov al,00000000b
  out 33h,al ;CB=00000000

  in al,30h
  cmp al,0
  jns false
true:
  mov bx,offset msjtrue
  mov al,offset msjfalse-offset msjtrue
  int 7
  jmp fin
false:
  mov bx,offset msjfalse
  mov al,offset finmsj2-offset msjfalse
  int 7
fin:int 0
end