org 100h

num1 db 0        ; first number
num2 db 0        ; second number

; Take first input
mov ah, 01h
int 21h
sub al, '0'
mov [num1], al

; Take second input
mov ah, 01h
int 21h
sub al, '0'
mov [num2], al

; Compare and find biggest
mov al, [num1]
mov bl, [num2]
cmp al, bl
jge first_is_bigger

; If second is bigger
mov dl, bl
jmp print_result

first_is_bigger:
mov dl, al

print_result:
add dl, '0'       ; convert to ASCII
mov ah, 02h
int 21h

ret
