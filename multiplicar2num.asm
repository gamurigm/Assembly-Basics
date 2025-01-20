org 100h  

MOV AL, 3         ; Primer numero
MOV BL, 4         ; Segundo numero
MUL BL            ; Multiplicar (3 x 4)

; Mostrar el 1
MOV CL, 10        ; Preparar para dividir entre 10
DIV CL            ; AL = 12/10 = 1 (cociente), AH = 2 (residuo)
ADD AL, '0'       ; Convertir 1 a ASCII
MOV DL, AL        ; Mover a DL para imprimir
MOV AH, 02h       ; Función de impresión
INT 21h           ; Mostrar el '1'

; Mostrar el 2
MOV DL, AH        ; Mover el residuo (2) a DL
ADD DL, '0'       ; Convertir 2 a ASCII
MOV AH, 02h       ; Función de impresión
INT 21h           ; Mostrar el '2'

ret