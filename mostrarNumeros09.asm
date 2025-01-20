org 100h         

MOV AH, 02h       ;funcion de DOS para imprimir un caracter

MOV DL, '0' ; ASCII de '0'
INT 21h     ; Llamada a la interrupción
MOV DL, 0Dh ;Este carácter mueve el cursor al inicio de la linea actual
INT 21h
MOV DL, 0Ah ;Este carácter mueve el cursor hacia abajo, a la línea siguiente      
INT 21h

MOV DL, '1'      
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

MOV DL, '2'       
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

MOV DL, '3'       
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

MOV DL, '4'       
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

MOV DL, '5'      
INT 21h
MOV DL, 0Dh      
INT 21h
MOV DL, 0Ah      
INT 21h

MOV DL, '6'       
INT 21h
MOV DL, 0Dh      
INT 21h
MOV DL, 0Ah     
INT 21h

MOV DL, '7'       
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

MOV DL, '8'       
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

MOV DL, '9'       
INT 21h
MOV DL, 0Dh       
INT 21h
MOV DL, 0Ah       
INT 21h

ret
