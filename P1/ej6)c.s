ORG 1000H
  num1 db 5h
  num2 db 3h
  RES db ?
ORG 3000H
MUL:  mov dl,0
      mov bx,ax
      cmp byte ptr[bx],0
      jz fin
      mov bx,cx
      cmp byte ptr[bx],0
      jz fin
lazo: mov bx,ax
      add dl,byte ptr [bx]
      mov bx,cx
      dec byte ptr[bx]
      jnz lazo
fin: ret
ORG 2000H
      mov ax,OFFSET num1
      mov cx,OFFSET num2
      call MUL
      mov RES,dl
HLT
END