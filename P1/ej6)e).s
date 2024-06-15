ORG 1000H
  num1 db 5h
  num2 db 3h
  RES db ?
ORG 3000H
MUL:  mov dl,0
      mov bx,sp
      add bx,2
      mov bx,word ptr[bx]
      mov al,byte ptr[bx]
      cmp al,0
      jz fin
      mov bx,sp
      add bx,4
      mov bx,word ptr[bx]
      mov ah,byte ptr[bx]
      cmp ah,0
      jz fin
lazo: add dl,ah
      dec al
      jnz lazo
fin:  mov RES,dl
      ret
ORG 2000H
      mov ax,offset num1
      push ax
      mov ax,offset num2
      push ax 
      call MUL
      pop ax
      pop ax
HLT
END