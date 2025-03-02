;division
org 100h  

mov al, 6
mov bl, 2

div bl
mov dl, al

add dl,"0"
mov ah,02h
int 21h

ret