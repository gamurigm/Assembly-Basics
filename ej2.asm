
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al, datoA
add al, datoB


ret

datoA db 5; bin=00000101b
datoB db 10; hex=0AH o bin=?



