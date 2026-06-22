.model small
.stack 100h
.data
crlf db 13, 10, '$'
string db 100 dup(?)
char db ?
cnt dw 0
muoi dw 10

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    lea di, string
    
    ; nhap ky tu
    mov ah, 1
    int 21h
    mov char, al
    
    lea dx, crlf
    mov ah, 9
    int 21h
    
    ; nhap xau
    nhap:
    mov ah, 1
    int 21h
    
    cmp al, 13
    je khoitao
    cmp al, char
    je count
    
    stosb
    jmp nhap
    
    count:
    inc cnt
    stosb
    jmp nhap
    
    khoitao:
    lea dx, crlf
    mov ah, 9
    int 21h
    
    mov ax, cnt
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