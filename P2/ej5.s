org 1000h
cadena  db ?
long db 10
org 3000h
leer_str_n:
  mov bx, sp
  add bx,2
  int 7
 ret
org 2000h
  mov al,long
  mov bx,offset cadena
loop: 
  int 6
  inc bx
  dec al
  jnz loop
  mov bx,offset cadena
  mov al,long
  int 7
  push bx
fin:    hlt
        end