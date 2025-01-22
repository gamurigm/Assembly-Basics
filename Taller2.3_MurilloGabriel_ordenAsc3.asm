org 100h

; Ingreso del primer número
mov dx, offset msg1
mov ah, 9
int 21h
mov ah, 1
int 21h
sub al, 30h
mov num1, al
call saltoLinea

; Ingreso del segundo número
mov dx, offset msg2
mov ah, 9
int 21h
mov ah, 1
int 21h
sub al, 30h
mov num2, al
call saltoLinea

; Ingreso del tercer número
mov dx, offset msg3
mov ah, 9
int 21h
mov ah, 1
int 21h
sub al, 30h
mov num3, al
call saltoLinea

; Ordenamiento usando variables en memoria en lugar de registros
ordenar:
    mov al, num1
    mov bl, num2
    cmp al, bl
    jle siguiente1
    mov num1, bl
    mov num2, al
    
siguiente1:
    mov al, num2
    mov bl, num3
    cmp al, bl
    jle siguiente2
    mov num2, bl
    mov num3, al
    jmp ordenar
    
siguiente2:
    mov al, num1
    mov bl, num2
    cmp al, bl
    jle mostrar
    mov num1, bl
    mov num2, al
    jmp siguiente1

mostrar:
; Mostrar el resultado
mov dx, offset msgResult
mov ah, 9
int 21h

; Mostrar números ordenados
mov al, num1      ; Primer número
mov dl, al
add dl, 30h
mov ah, 2
int 21h

mov dl, ' '       ; Espacio
int 21h

mov al, num2      ; Segundo número
mov dl, al
add dl, 30h
mov ah, 2
int 21h

mov dl, ' '       ; Espacio
int 21h

mov al, num3      ; Tercer número
mov dl, al
add dl, 30h
mov ah, 2
int 21h

ret

saltoLinea PROC
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    ret
saltoLinea ENDP

msg1 db "Ingrese el primer numero (0-9): $"
msg2 db "Ingrese el segundo numero (0-9): $"
msg3 db "Ingrese el tercer numero (0-9): $"
msgResult db "Numeros ordenados de menor a mayor: $"
num1 db 0
num2 db 0
num3 db 0