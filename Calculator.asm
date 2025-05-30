.MODEL SMALL
.STACK 100h

.DATA
    operator_prompt DB 'Enter the operator (+, -, *, /): $'
    input1_prompt   DB 13,10, 'Enter First Digit (0-9): $'
    input2_prompt   DB 13,10, 'Enter Second Digit (0-9): $'
    result_msg      DB 13,10, 'The result is: $'
    newline         DB 13,10, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt for operator
    LEA DX, operator_prompt
    CALL PrintString
    CALL ReadChar
    MOV BH, AL         ; Store operator in BH

    ; Prompt for first digit
    LEA DX, input1_prompt
    CALL PrintString
    CALL ReadNumber
    MOV CH, AL         ; Store first number in CH

    ; Prompt for second digit
    LEA DX, input2_prompt
    CALL PrintString
    CALL ReadNumber
    MOV CL, AL         ; Store second number in CL

    ; Perform operation
    MOV AL, CH         ; Load first number into AL
    CMP BH, '+'
    JE ADDITION
    CMP BH, '-'
    JE SUBTRACTION
    CMP BH, '*'
    JE MULTIPLICATION
    CMP BH, '/'
    JE DIVISION

    JMP SHOW_RESULT    ; Default jump

ADDITION:
    ADD AL, CL
    JMP STORE_RESULT

SUBTRACTION:
    SUB AL, CL
    JMP STORE_RESULT

MULTIPLICATION:
    MUL CL             ; AL = AL * CL (unsigned)
    JMP STORE_RESULT

DIVISION:
    MOV AH, 0
    DIV CL             ; AL = AL / CL
    JMP STORE_RESULT

STORE_RESULT:
    MOV BL, AL         ; Store result in BL

SHOW_RESULT:
    LEA DX, result_msg
    CALL PrintString
    ADD BL, '0'        ; Convert to ASCII
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; Exit program
    MOV AH, 4Ch
    INT 21h

MAIN ENDP

; -------------------------------------------------
PrintString PROC
    MOV AH, 09h
    INT 21h
    RET
PrintString ENDP

ReadChar PROC
    MOV AH, 01h
    INT 21h
    RET
ReadChar ENDP

ReadNumber PROC
    MOV AH, 01h
    INT 21h
    SUB AL, '0'
    RET
ReadNumber ENDP

END MAIN
