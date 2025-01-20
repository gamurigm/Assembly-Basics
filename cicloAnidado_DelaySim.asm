
; You may customize this. The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
        
inicio:        
    mov M, 9

ciclo2:
    mov N, 9

ciclo1:
    dec N
    jnz ciclo1
    dec M
    jnz ciclo2

loop inicio

ret        
M db 0
N db 0




