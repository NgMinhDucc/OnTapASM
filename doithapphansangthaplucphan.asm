.model small
.stack 100h
.data
crlf db 13, 10, '$'
x dw 0
y dw ?
muoi dw 10
hex dw 16

.code
main proc
    mov ax, @data
    mov ds, ax
    
    nhap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je khoitao
        
        mov ah, 0
        sub al, 48
        
        mov y, ax
        mov ax, x
        mul muoi
        add ax, y
        mov x, ax
        jmp nhap
    
    khoitao:
        lea dx, crlf
        mov ah, 9
        int 21h
        
        mov ax, x
        mov cx, 0
    
    chia:
        mov dx, 0
        div hex
        push dx
        inc cx
        
        cmp ax, 0
        je quydoi
        jmp chia
    
    quydoi:
        pop dx
        cmp dl, 9
        ja phanchu
        add dl, 48
        jmp inra
    
    phanchu:
        add dl, 55
    
    inra:
        mov ah, 2
        int 21h
        loop quydoi
    
    mov ah, 4ch
    int 21h
main endp
end main