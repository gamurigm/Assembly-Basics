org 100h



start:
    ; Mensaje para ingresar el número inicial
    mov dx, offset msg1
    mov ah, 9
    int 21h

    ; Leer el primer dígito
    mov ah, 1
    int 21h
    sub al, 30h
    mov bl, al ; Guardar primer dígito en BL

    ; Leer el segundo dígito
    mov ah, 1
    int 21h
    sub al, 30h
    mov bh, al ; Guardar segundo dígito en BH

    ; Calcular el número completo
    mov al, bl
    mov ah, 0
    mov cl, 10
    mul cl       ; Multiplicar por 10
    add al, bh   ; Sumar el segundo dígito
    mov N, al    ; Guardar el número en N

    ; Línea nueva
    call saltoLinea

    ; Mensaje para ingresar el intervalo
    mov dx, offset msg2
    mov ah, 9
    int 21h

    ; Leer el intervalo
    mov ah, 1
    int 21h
    sub al, 30h
    mov Intervalo, al ; Guardar el intervalo

decrement_loop:
    ; Mostrar el mensaje de resultado
    mov dx, offset msgResult
    mov ah, 9
    int 21h

    ; Mostrar el número decrementado
    mov ah, 0
    mov al, N
    add al, 30h
    mov dl, al
    mov ah, 2
    int 21h

    ; Línea nueva
    call saltoLinea

    ; Restar el intervalo
    mov al, N
    sub al, Intervalo
    mov N, al

    ; Verificar si el número es menor o igual a cero
    cmp N, 0
    jg decrement_loop

    ; Finalizar el programa
    mov ah, 4Ch
    int 21h

saltoLinea:
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
       
; Variables y mensajes
msg1 db "Ingrese un numero de dos digitos: $"
msg2 db "Ingrese el intervalo de decremento: $"
msgResult db "Decremento: $", 0Dh, 0Ah, "$"
N db 0           ; Almacena el número inicial
Intervalo db 0   ; Almacena el intervalo de decremento       