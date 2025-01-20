
.model small
.stack 100h

.data
    mensaje1 DB "Ingrese el numero A (0-9):$"
    mensaje2 DB "Ingrese el numero B (0-9): $"
    mensaje_menor DB "Numero A es menor que numero B$"
    mensaje_mayor DB "Numero A es mayor que numero B$"
    mensaje_igual DB "Los numeros A y B son iguales$"
    crlf DB 0Dh, 0Ah, '$'

.code
main PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09h
    LEA DX, mensaje1
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, 30h  
    MOV BL, AL 

    MOV AH, 09h
    LEA DX, mensaje2
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, 30h  
    MOV CL, AL   

    CMP BL, CL
    JL menor      
    JG mayor      

    MOV AH, 09h
    LEA DX, mensaje_igual
    INT 21h
    JMP fin

menor:
    MOV AH, 09h
    LEA DX, mensaje_menor
    INT 21h
    JMP fin

mayor:
    MOV AH, 09h
    LEA DX, mensaje_mayor
    INT 21h
    JMP fin

fin:
    MOV AH, 09h
    LEA DX, crlf
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
