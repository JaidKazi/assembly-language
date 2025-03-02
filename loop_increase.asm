
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov cx, 5  ; loop counter
mov dl, '1'  ; starting value to print 9

start_loop:  ; label for the loop
    mov ah, 02h  ; function to print the character in dl
    int 21h      ; call DOS interrupt to print

    dec dl       ; decrease dl 
    loop start_loop ; decrement cx and loop if cx != 0

mov ah, 0  ; wait for a key press
int 16h

ret  ; return to DOS


