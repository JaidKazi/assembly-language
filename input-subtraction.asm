
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov ah, 01h
    int 21h
    sub al, 30h 
    
    mov bl, al  
    mov ah, 01h 
    int 21h
    sub al, 30h

sub bl, al
mov dl, bl
add dl, "0"
mov ah, 02h
int 21h
ret




