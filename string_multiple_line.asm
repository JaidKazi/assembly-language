.model small  ;
.stack 100h    ;
                ;
.data
line1 db " Hello World!", 0Dh, 0Ah, '$' ;                                0D->Carrige Return
line2 db " Hello Bangladesh", 0Dh, 0Ah, '$';                             0D->New Line
line3 db " Hello Bangladesh", 0Dh, 0Ah, '$';                             0D->New Line
     ;                                                             lea-> Load Effective Address
.code ;     ;
main proc    ;
    mov ax, @data ;
    mov ds, ax     ;
                    ;
    mov ah, 09h       ; String Print
    lea dx, line1    ;
    int 21h            ;
                       ;
    mov ah, 09h         ;
    lea dx, line2        ;
    int 21h               ;
                           ;
    mov ax, 4C00h    ; exit program
    int 21h                 ;
                             ;
ret    
;main endp
;end main
