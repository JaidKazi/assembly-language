org 100h  

; Input first number (dividend)
mov ah, 01h    ; DOS function: Input a character
int 21h        ; Get first number (dividend)
sub al, '0'    ; Convert ASCII to integer
mov bl, al     ; Store dividend in BL

; Input second number (divisor)
mov ah, 01h    ; DOS function: Input a character
int 21h        ; Get second number (divisor)
sub al, '0'    ; Convert ASCII to integer
mov bh, al     ; Store divisor in BH

; Prepare for division
mov al, bl     ; Move dividend to AL
mov ah, 0      ; Clear AH (AX = AL)
div bh         ; AX = AX / BH (Quotient -> AL, Remainder -> AH)

; Display quotient
mov dl, al     ; Move quotient to DL
add dl, '0'    ; Convert quotient to ASCII
mov ah, 02h    ; DOS function: Print character
int 21h        ; Display quotient

ret            ; Return to DOS