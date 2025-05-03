org 100h

mov dx,offset message

mov ah,09
int 21h  

mov dx,offset message1

mov ah,09
int 21h

ret    

message db "Hello World$"  
message1 db " PCIU Black Panthar No:1 Team$"
