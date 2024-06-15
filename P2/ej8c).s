ORG 2000h
  mov al,11111111b
  out 32h,al ;CA=11111111
  mov al,00000000b
  out 33h,al ;CB=00000000
loop:
  in al,30h
  out 31h,al
  jmp loop
fin:int 0
end