org 100h          

MOV AL, 10        ; Dividendo (10)
MOV BL, 2         ; Divisor (2)
DIV BL            ; Dividir AL entre BL. Cociente en AL, resto en AH

ADD AL, '0'       ; Convertir el cociente a ASCII
MOV DL, AL        ; Mover el caracter a DL para imprimir
MOV AH, 02h       ; Para imprimir un caracter
INT 21h           ; Imprimir el (cociente)

MOV DL, 0Ah       ; Salto de linea
INT 21h           ; Imprimir el salto de linea

ret              
