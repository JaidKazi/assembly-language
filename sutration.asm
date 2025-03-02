org 100h

mov al, 15
mov bl, 14
sub al, bl

add al, "0"
mov dl, al
mov ah, 02h
int 21h

ret