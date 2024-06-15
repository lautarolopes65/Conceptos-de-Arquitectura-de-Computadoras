org 1000h
A dw 8
B dw 5
C dw 4
D dw ?
org 3000h
CALC: mov DX,0
      mov BX,SP
      add BX,2
      add DL,[BX]
      add BX,2
      add DL,[BX]
      add BX,2
      sub DL,[BX]
  ret
org 2000h
mov CX,C
push CX
mov BX,B
push BX
mov AX,A
push AX
call CALC
pop AX
pop BX
pop CX
mov D,DX
hlt
end 