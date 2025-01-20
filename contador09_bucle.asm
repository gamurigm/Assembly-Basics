
;Contar del 0 al 9 con un bucle

org 100h          

MOV AH, 02h       ; Pra imprimir un carácter
MOV CX, 10        ; Establecemos el contador para 10 repeticiones (del 0 al 9)       

contar:
    PUSH CX       ; Guardamos CX en la pila
    
    MOV DL, '0'   ; Cargar el  '0' en DL
    ADD DL, 10    ; total de iteraciones
    SUB DL, CL    ; Restamos el contador actual para obtener el número correcto
    INT 21h       ; Imprimir el número
    
    MOV DL, 0Dh   ; Retorno de carro
    INT 21h
    MOV DL, 0Ah   ; Salto de linea
    INT 21h
    
    POP CX        ; Recuperamos el valor original de CX
    LOOP contar   ; Decrementa CX y repite el bucle si CX > 0

MOV AH, 4Ch       ; Función de DOS para terminar el programa
INT 21h           
ret               