org 100h      ; Start of the program (COM file format)

mov al, 11   ; Load 15 into AL
mov bl, 11    ; Load 14 into BL
add al, bl    ; AL = AL + BL, AL = 15 + 14 = 29

mov cl, 10    ; Load 10 into CL (for division)

; Display the tens digit
mov ah, 0     ; Clear AH (upper byte of AX for division)
div cl        ; Divide AX by CL: AL = AX / CL (tens digit), AH = AX % CL (units digit)
              ; AL = 2 (tens digit), AH = 9 (units digit)

mov dl, al    ; Move tens digit (AL) to DL
add dl, '0'   ; Convert digit to ASCII by adding '0'
mov ah, 02h   ; Set AH to 02h (DOS function to display a character)
int 21h       ; Call DOS interrupt to display tens digit

; Display the units digit
mov dl, ah    ; Move units digit (AH) to DL
add dl, '0'   ; Convert digit to ASCII by adding '0'
mov ah, 02h   ; Set AH to 02h (DOS function to display a character)
int 21h       ; Call DOS interrupt to display units digit

ret           ; End of program