
org 100h  

;for multiplication

mov al, 4
mov bl, 2 

mul bl
mov dl, al

add dl,"0"
mov ah,02h
int 21h

ret