        .model small
        .stack 100h
        .386
        .data
a dw 120
b dw 50
ans db ?
        .code
start:  mov ax, @data
        mov ds, ax

        mov ax, a
        mov bx, b
        idiv bx

        mov bx, 7
        mov cx, 14
main:  
        call incbx
        rol bx, 1
        loop main


        mov ax, 4c00h
        int 21h

        incbx proc
        mov ax, dx
        and ax, bx
        cmp ax, 0000h
        lahf
        and ah, 01000000b
        ror ah, 6
        add ans, ah
        ret
        endp
        end start
