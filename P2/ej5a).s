ORG 1000h
vocales db "AaEeIiOoUu"
finvoc db ?
cant db "x vocal/es"
fincant db ?
salto_ln db 0Ah
cadena db ? 
ORG 3000h
esvocal:
    cmp dl,[bx]
    jz true 
    inc bx
    dec dh
    jnz esvocal
    mov dl,00h
    jmp false
true:mov dl,0ffh
false:ret
    
contar_voc:
    mov cl,30h
bucle: 
    mov dl,byte ptr[bx]
    push bx
    mov bx,offset vocales
    mov dh,offset finvoc-offset vocales
    call esvocal
    cmp dl,0ffh
    jnz sigo
    inc cl  ;es vocal,sumo al contador
sigo:
    pop bx
    inc bx
    dec al
    jnz bucle
    ret

leer_str_n:
  mov bx, sp
  add bx,2
  mov bx,[bx]
loop: 
  int 6
  inc bx
  dec al
  jnz loop
  mov bx,offset cadena
  mov al,0Ah
  int 7
  call contar_voc
  mov bx,offset salto_ln
  mov al,1
  int 7
  mov cant,cl
  mov bx,offset cant 
  mov al,offset fincant-offset cant
  int 7
  
 ret
 
ORG 2000h
  mov al,0Ah
  mov bx,offset cadena
  push bx
  call leer_str_n
fin:int 0
end