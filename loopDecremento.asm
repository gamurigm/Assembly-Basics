org 100h

mov bl, N

ciclo:
    dec bl
    mov dl, bl    
    add dl, 48     ;Para cambirlo a ASCII
    mov ah, 2
    int 21h
    loop ciclo


ret
N db 10



