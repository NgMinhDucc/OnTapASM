.model small
.stack 100h
.data
x dw 0
y dw ?
muoi dw 10
crlf db 13, 10, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    nhap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je khaibao
        
        mov ah, 0
        sub al, 48
        
        mov y, ax
        mov ax, x
        mul muoi
        add ax, y
        mov x, ax
        jmp nhap
    
    khaibao:
        lea dx, crlf
        mov ah, 9
        int 21h
        
        mov ax, x
        mov cx, 0
    
    chia:
        mov dx, 0
        div muoi
        push dx
        inc cx
        
        cmp ax, 0
        je inra
        jmp chia
    
    inra:
        pop dx
        add dx, 48
        mov ah, 2
        int 21h
        loop inra
    
    mov ah, 4ch
    int 21h
main endp
end main
    