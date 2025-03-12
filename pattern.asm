
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h

mov cx, 1        ; Initialize outer loop counter (number of stars per row)

outer_loop:
    mov bx, cx    ; Set inner loop counter to current row number
    mov ah, 02h   ; DOS function to display a character

inner_loop:
    mov dl, '*'   ; Load '*' into DL
    int 21h       ; Display '*'
    dec bx        ; Decrement inner loop counter
    jnz inner_loop ; Repeat inner loop until BX = 0

    ; Print newline
    mov dl, 0Dh   ; Carriage return
    int 21h
    mov dl, 0Ah   ; Line feed
    int 21h

    inc cx        ; Increment outer loop counter (next row)
    cmp cx, 6     ; Compare CX with 6 (stop after 5 rows)
    jl outer_loop ; Repeat outer loop if CX < 6

ret

ret




