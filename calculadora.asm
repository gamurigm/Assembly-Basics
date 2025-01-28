org 100h 

inicio:     

    ; Leer los numeros
    mov ah, 9
    
    lea dx, texto1
    int 21h                
    call leer_numero1
    mov num1, cx 

    call leer_numero2
    mov num2, cx    

    ; Mostrar el menu de operaciones
    call leer_operacion
    mov operacion, al

    ; Realizar la operacion seleccionada
    cmp operacion, '+'
    je sumar
    cmp operacion, '-'
    je restar
    cmp operacion, '*'
    je multiplicar
    cmp operacion, '/'
    je dividir
    jmp error_entrada

sumar:
    mov ah, 09h
    lea dx, texto4
    int 21h
    mov ax, num1 
    add ax, num2 
    call imprimir_numero
    jmp fin

restar:
    mov ah, 09h
    lea dx, texto5
    int 21h
    mov ax, num1 
    sub ax, num2 
    call imprimir_numero
    jmp fin

multiplicar:
    mov ah, 09h
    lea dx, texto6
    int 21h
    mov ax, num1 
    mov bx, num2 
    mul bx ; ax = ax * bx
    call imprimir_numero
    jmp fin

dividir:
    mov ah, 09h
    lea dx, texto7
    int 21h
    xor dx, dx 
    mov ax, num1 
    mov bx, num2 
    div bx 
    call imprimir_numero
    jmp fin

error_entrada:
    mov ah, 09h
    lea dx, error_msg
    int 21h
    jmp inicio

fin:
    ret

leer_numero1:
    ; Lee el primer numero
    mov ah, 09h
    lea dx, texto2
    int 21h 
    
leer_numero1_loop:
    call leer_numero
    cmp cx, 0
    je leer_numero1_loop
    ret

leer_numero2:
    ; Lee el segundo numero
    mov ah, 09h
    lea dx, texto3
    int 21h
leer_numero2_loop:
    call leer_numero
    cmp cx, 0
    je leer_numero2_loop
    ret

leer_operacion:
    ; Lee la operacion
    mov ah, 09h
    lea dx, mensaje_op
    int 21h
leer_operacion_loop:
    mov ah, 01h
    int 21h
    cmp al, '+'
    je leer_operacion_1
    cmp al, '-'
    je leer_operacion_1
    cmp al, '*'
    je leer_operacion_1
    cmp al, '/'
    je leer_operacion_1
    jmp error_entrada
leer_operacion_1:
    ret

leer_numero:
    ; Lee un numero
    mov ah, 0Ah
    lea dx, buffer
    int 21h

    ; Validacion de ingreso exactamente 2 digitos
    cmp buffer[1], 2
    jne error_numero

    ; Convertir a numero
    mov ax, 0
    mov al, buffer[2]
    sub al, '0'
    mov cl, buffer[3]
    sub cl, '0'
    mov ch, 0
    mov bx, 10
    mul bx
    add ax, cx
    mov cx, ax
    ret

error_numero:
    mov ah, 09h
    lea dx, error_num
    int 21h
    xor cx, cx
    
    ret

imprimir_numero:
    ; Imprime el numero en AX
    mov bx, 10
    mov cx, 0
    
imprimir_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne imprimir_loop 
    
imprimir_digitos:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop imprimir_digitos
    ret   

; Mensajes y Variables

texto1 db 13,10,'CALCULADORA DIGITAL$'
texto2 db 13,10,13,10,'Digite el Primer Numero (00-99): $'
texto3 db 13,10,13,10,'Digite el Segundo Numero (00-99): $'   
mensaje_op db 13,10,13,10,'Digite la operacion (+,-,*,/): $'
texto4 db 13,10,13,10, 'La Suma Es: $'
texto5 db 13,10,'La Resta Es: $'
texto6 db 13,10,'La Multiplicacion Es: $'
texto7 db 13,10,'La Division es: $'
error_msg db 13,10,'Error: Operacion invalida. Vuelve a intentarlo.$'
error_num db 13,10, 13,10, 'Error: Numero invalido. Vuelve a intentarlo: $'

num1 dw ? 
num2 dw ? 
operacion db ?
buffer db 5, 0, 0, 0, 0 ;  //USO DE BUFFER LEER Y ALMACENAR NUMEROS INGRESADOS 
