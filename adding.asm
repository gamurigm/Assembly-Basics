name "ejemplo1"

org 100h ;Este micro tiene asignada una dir de mem donde trabaja, 100h le dice que recorra 100 registros mas adelante.

mov al, 5
mov bl, 10 
add bl, al ;el resultado se guarda en bl: 0F

ret




