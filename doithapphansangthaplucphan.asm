.model small
.stack 100h
.data
x dw 0
crlf db 13, 10, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov bx, 10
    nhap:
    mov ah, 1
    int 21h
    
    cmp al, 13
    je khoitao
    
    mov ah, 0
    sub al, 48
    
    mov cx, ax
    mov ax, x
    mul bx
    add ax, cx
    mov x, ax
    jmp nhap
    
    khoitao:
    lea dx, crlf
    mov ah, 9
    int 21h
    
    mov ax, x
    mov bx, 2
    mov cx, 0
    
    chia2:
    mov dx, 0
    div bx
    push dx
    inc cx
    
    cmp ax, 0
    je inra2
    jmp chia2
    
    inra2:  
    pop dx
    add dl, 48
    mov ah, 2
    int 21h   
    loop inra2
    
    khoitao2:
    lea dx, crlf
    mov ah, 9
    int 21h
    
    mov ax, x
    mov bx, 16
    mov cx, 0
    
    chia16:
    mov dx, 0
    div bx
    push dx
    inc cx
    
    cmp ax, 0
    je quydoi
    jmp chia16
    
    quydoi:
    pop dx
    cmp dl, 9
    ja phanchu
    add dl, 48
    jmp inra16
    
    phanchu:
    add dl, 55
    
    inra16:
    mov ah, 2
    int 21h
    loop quydoi
    
    mov ah, 4ch
    int 21h
main endp
end main