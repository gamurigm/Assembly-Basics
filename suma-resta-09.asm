
org 100h

mov al, 3 ;primer numero
mov bl, 2 ;segundo numero
add al, bl
add al, '0'
mov dl, al
mov ah, 2
int 21h

mov dl, ' '
int 21h

mov al, 3
mov bl, 2
sub al, bl
add al, '0'
mov dl, al
mov ah, 2
int 21h

mov ah, 4Ch
int 21h


ret




