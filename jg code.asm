
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ah,01h ;first input -->BL=7
int 21h    ;
sub al,'0' ;30h minus             jmp level_name
mov al, bl ; move to bl           cmp a,b
           ;     -->BH=9         jump--> jg label name
mov ah,01h ;Secound input
int 21h    ;                                   \
sub al,'0' ;30h minus                          cmp a , b
mov bh,al  ;move to bh                              j labale name /   jl labale name
           ;
cmp bl,ah  ;
jg print_a ;jmp only in case of BL larger value
mov dl,'B' ; 
           ;jmp finish
print_a    ;
mov dl,'A' ;
           ;finish
mov ah,02h ;
int 21h    ;
ret        ;




