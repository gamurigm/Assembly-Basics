org 100h          

; Leer un caracter del usuario
MOV AH, 01h       ; Funcion de DOS para leer un caracter
INT 21h           ; Leer caracter del teclado

; Verificar si es mayuscula y convertir
CMP AL, 'A'       ; Comparar con 'A'
JL imprimir       ; Si es menor que 'A', no es letra mayúscula
CMP AL, 'Z'       ; Comparar con 'Z'
JG imprimir       ; Si es mayor que 'Z', no es letra mayúscula
ADD AL, 32        ; Convertir de mayúscula a minúscula

imprimir:
MOV DL, AL        ; Mover el caracter a DL
MOV AH, 02h       ; Para imprimir
INT 21h           ; Mostrar el carácter

MOV AH, 4Ch       
INT 21h
                  
ret                  