
org 100h   ;
;
num1 db 0;           db->define byte         int a=0
num2 db 0 ;          dw-> define word
result db 0;                                 variable name variable type
            ;                        int num1 =0;
mov ah,01h; user input               num1 -> user input first
int 21h    ;                         num2 -> user input secound
sub al,'0'  ;                        add [num1],[num2]
mov [num1],al;  
;
mov ah,01h    ;
int 21h     ;
sub al,'0'   ;
mov [num2],al  ;
               ;
mov al,[num1]   ;
add al,[num2]    ;
mov [result],al  ;
                  ;
mov dl,[result]   ;
add dl,'0'        ;
mov ah,02h        ;
int 21h            ;
ret                 ;




