
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


mov ah, 01h     
int 21h
sub al, '0'     
mov bl, al     

mov ah, 01h     
int 21h
sub al, '0'
mov bh, al      


mov ah, 01h     
int 21h
sub al, '0'
mov cl, al      

cmp bl, bh
jg check_cl     
mov bl, bh     

check_cl:
cmp bl, cl
jg print_result 
mov bl, cl     

print_result:
add bl, '0'     
mov dl, bl      
mov ah, 02h     
int 21h

ret
