
  
org 100h

; Mensaje
mov dx, offset msg1 
mov ah, 9 
int 21h

;lectura primer numero
mov ah,1
int 21h 
sub al,30h
mov num1,al

call p1

; Mensaje
mov dx, offset msg2 
mov ah, 9 
int 21h

;lectura segundo numero
mov ah,1
int 21h 
sub al,30h
mov num2,al

cmp num1, al
je igual
jg mayor
jl menor

igual:
    call p1
    mov dx, offset msgigual 
    mov ah, 9 
    int 21h
    loop  fin
mayor:
    mov dx, offset msgmayor 
    mov ah, 9 
    int 21h
    loop  fin 
menor:
    mov dx, offset msgmenor
    mov ah, 9 
    int 21h
fin:
ret

p1 PROC     ; procedure declaration.
    ;salto de linea
    mov ah, 2
    mov dl,0Ah
    int 21h
    ;retorno inicio de linea
    mov ah, 2
    mov dl,0Dh
    int 21h
    
    RET     ; return to caller.
p1 ENDP

msg1 db "Ingrese el numero 1: $"
msg2 db "Ingrese el numero 2: $"
msgigual db "Los numeros son iguales $"
msgmayor db 10, 13, "El numero 1 es mayor que el numero 2 $"
msgmenor db 10, 13, "El numero 1 es menor que el numero 2 $"
num1 db 0
num2 db 0