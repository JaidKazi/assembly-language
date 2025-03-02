; Program to input two single-digit numbers, add them, and display the result.

mov ah, 01h       ; Set AH to 01h (DOS function to read a character from input)
int 21h           ; Call DOS interrupt to read a character (stored in AL)
sub al, 30h       ; Convert ASCII character to numeric value by subtracting '0' (30h)

mov bl, al        ; Store the first number in BL

mov ah, 01h       ; Set AH to 01h again to read the second character
int 21h           ; Call DOS interrupt to read the second character (stored in AL)
sub al, 30h       ; Convert ASCII character to numeric value by subtracting '0' (30h)

add al, bl        ; Add the first number (BL) to the second number (AL), result in AL

mov dl, al        ; Move the result (AL) to DL for output
add dl, "0"       ; Convert the numeric result back to ASCII by adding '0' (30h)

mov ah, 02h       ; Set AH to 02h (DOS function to display a character)
int 21h           ; Call DOS interrupt to display the result (DL)

ret               ; End of program