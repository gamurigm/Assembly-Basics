
;Escriba un programa en Emsamblador que omprema lo siguiente en pantalla. Restricciion: No utilizar multiples pmensajes.
;*
;**
;***
;****           de 1 hasta 9 *s
;*****
;******
;*******
;********
;*********

;EVAL2P_Murillo

org 100h

    mov cx, 1          ; Contador de asteriscos por linea
                  
bucle_lineas:
    mov dl, '*'        ; asterisco en dl
    mov bx, cx         ; cx en bx


bucle_asteriscos:
    mov ah, 2          
    int 21h            ; imprime el asterisco
    
    loop bucle_asteriscos  
    
    mov dl, 10        ; Nueva linea
    mov ah, 2
    int 21h
    
    mov dl, 13        ; Retorno de carro
    mov ah, 2
    int 21h   
    
    mov cx, bx         ; Restaurar contador
    inc cx             ; Incrementar contador
    cmp cx, 10         ; Comparar si llegamos a 10
    jl bucle_lineas    ; Si es menor, continuar
       
ret




