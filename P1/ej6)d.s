ORG 1000H
  num1 db 5h
  num2 db 3h
  RES db ?
ORG 3000H
MUL:  mov dl,0
      mov bx,sp
      add bx,2
      mov al,byte ptr[bx]
      cmp al,0
      jz fin
      add bx,2
      mov ah,byte ptr[bx]
      cmp ah,0
      jz fin
lazo: add dl,ah
      dec al
      jnz lazo
fin:  mov RES,dl
      ret
ORG 2000H
      mov al,num1
      push ax
      mov al,num2
      push ax 
      call MUL
      pop ax
      pop ax
HLT
END