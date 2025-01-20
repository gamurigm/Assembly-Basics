org 100h

inicio:        
    mov M, 9
          
ciclo2:
    mov N, 9       
    
    mov ah, 2      
    mov dl, M      
    add dl, 48   
    int 21h
    
ciclo1:
    ; Muestra N
    mov ah, 2
    mov dl, N      ; Obtiene valor de N
    add dl, 30h    ; Convierte a ASCII
    int 21h
    
    ; Espacio entre números
    mov dl, 20h    ; Espacio en ASCII
    int 21h
    
    dec N          ; Decrementa N
    jnz ciclo1
    
    ; Nueva línea
    mov ah, 2
    mov dl, 0Dh    ; Retorno de carro
    int 21h
    mov dl, 0Ah    ; Nueva línea
    int 21h
    
    dec M          ; Decrementa M
    jnz ciclo2

ret        

M db 0
N db 0