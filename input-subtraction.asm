org 100h       ; Start of the program

; Read first number from user
mov ah, 01h    ; DOS interrupt for single character input
int 21h        ; Get first digit
sub al, '0'    ; Convert ASCII to integer
mov bl, al     ; Store first number in BL

; Read second number from user
mov ah, 01h    ; DOS interrupt for single character input
int 21h        ; Get second digit
sub al, '0'    ; Convert ASCII to integer

; Perform subtraction: BL - AL
mov bh, 0      ; Clear BH to avoid sign extension issues
sub bl, al     ; BL = BL - AL

; Convert result to ASCII
mov al, bl     ; Move result to AL
add al, '0'    ; Convert to ASCII

; Display result
mov dl, al     ; Move ASCII result to DL
mov ah, 02h    ; DOS function to print character
int 21h        ; Print result

ret            ; End of program
