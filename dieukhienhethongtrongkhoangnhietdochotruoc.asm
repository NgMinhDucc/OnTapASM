.model small
.stack 100h
.data 
crlf db 13, 10, '$'
invalid db 'invalid$'
ok db 'ok$'
y dw 0
muoi dw 10

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov bx, 0
    nhap:
    mov ah, 1
    int 21h
    
    cmp al, 13
    je khoitao
    
    mov ah, 0
    sub al, 48
    
    mov y, ax
    mov ax, bx
    mul muoi
    add ax, y
    mov bx, ax
    jmp nhap
    
    khoitao:
    lea dx, crlf
    mov ah, 9
    int 21h
    
    cmp bx, 30
    jb khonghople
    cmp bx, 40
    ja khonghople
    
    lea dx, ok
    mov ah, 9
    int 21h
    jmp ketthuc
    
    khonghople:
    lea dx, invalid
    mov ah, 9
    int 21h
    jmp ketthuc
    
    ketthuc:
    mov ah, 4ch
    int 21h
main endp
end main