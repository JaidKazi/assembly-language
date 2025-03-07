org 100h

; Input first two-digit number
mov ah, 01h       ; DOS function to read a character
int 21h           ; Read first digit
sub al, '0'       ; Convert ASCII to numeric
mov bl, 10        ; Multiply by 10 for two-digit number
mul bl
mov bh, al        ; Store first digit * 10 in BH

mov ah, 01h       ; Read second digit
int 21h
sub al, '0'       ; Convert ASCII to numeric
add bh, al        ; Complete first number in BH

; Input second two-digit number
mov ah, 01h       ; Read first digit
int 21h
sub al, '0'       ; Convert ASCII to numeric
mov bl, 10        ; Multiply by 10 for two-digit number
mul bl
mov ch, al        ; Store first digit * 10 in CH

mov ah, 01h       ; Read second digit
int 21h
sub al, '0'       ; Convert ASCII to numeric
add ch, al        ; Complete second number in CH

; Perform multiplication
mov al, bh        ; Move first number to AL
mul ch            ; Multiply AL by CH (result in AX)

; Display result
mov bx, 10        ; Divisor for converting result to digits
mov cx, 0         ; Counter for digits

convert_loop:
xor dx, dx        ; Clear DX for division
div bx            ; Divide AX by 10 (quotient in AX, remainder in DX)
push dx           ; Push remainder (digit) onto stack
inc cx            ; Increment digit counter
cmp ax, 0         ; Check if quotient is zero
jne convert_loop  ; Repeat if not zero

display_loop:
pop dx            ; Pop digit from stack
add dl, '0'       ; Convert digit to ASCII
mov ah, 02h       ; DOS function to display character
int 21h           ; Display character
loop display_loop ; Repeat for all digits

ret               ; End program