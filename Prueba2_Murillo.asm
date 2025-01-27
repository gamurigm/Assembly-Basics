org 100h



start:
    ; Mensaje para ingresar el n�mero inicial
    mov dx, offset msg1
    mov ah, 9
    int 21h

    ; Leer el primer d�gito
    mov ah, 1
    int 21h
    sub al, 30h
    mov bl, al ; Guardar primer d�gito en BL

    ; Leer el segundo d�gito
    mov ah, 1
    int 21h
    sub al, 30h
    mov bh, al ; Guardar segundo d�gito en BH

    ; Calcular el n�mero completo
    mov al, bl
    mov ah, 0
    mov cl, 10
    mul cl       ; Multiplicar por 10
    add al, bh   ; Sumar el segundo d�gito
    mov N, al    ; Guardar el n�mero en N

    ; L�nea nueva
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

    ; Mostrar el n�mero decrementado
    mov ah, 0
    mov al, N
    add al, 30h
    mov dl, al
    mov ah, 2
    int 21h

    ; L�nea nueva
    call saltoLinea

    ; Restar el intervalo
    mov al, N
    sub al, Intervalo
    mov N, al

    ; Verificar si el n�mero es menor o igual a cero
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
N db 0           ; Almacena el n�mero inicial
Intervalo db 0   ; Almacena el intervalo de decremento       