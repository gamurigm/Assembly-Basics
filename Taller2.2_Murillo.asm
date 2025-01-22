org 100h
inicio:        
    mov M, 9
    mov N, 9

ciclo:
    mov ah, 2
    mov dl, M
    add dl, 48    ; Convierte a ASCII
    int 21h
    
    mov ah, 2
    mov dl, N
    add dl, 48
    int 21h
     
    mov ah, 2
    mov dl, 0Dh    ; Retorno de carro
    int 21h
    mov dl, 0Ah    ; Nueva linea
    int 21h
    
    dec N          
    jge ciclo      ;jge: Jump if Greater or Equal, Continua si N >= 0
    
    mov N, 9       ; Reinicia N
    dec M         
    jge ciclo      ; Continua si M >= 0
    
ret        
M db 0
N db 0