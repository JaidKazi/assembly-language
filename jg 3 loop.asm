
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov cx, 3        ; Set counter to 3 inputs
mov ah, 01h      ; Prepare to read first input
int 21h
sub al, '0'      ; Convert ASCII to number
mov bl, al       ; Store first input as the largest

dec cx           ; Reduce counter (already took first input)

input_loop:
    mov ah, 01h  ; Read next input
    int 21h
    sub al, '0'  ; Convert ASCII to number

    cmp al, bl   ; Compare with current largest
    jle skip_update ; If AL <= BL, skip update
    mov bl, al   ; Update BL with new larger value

skip_update:
    loop input_loop ; Loop until CX = 0

; Now BL has the largest number
add bl, '0'      ; Convert back to ASCII
mov dl, bl       ; Move to DL for printing
mov ah, 02h      ; Print function
int 21h

ret
