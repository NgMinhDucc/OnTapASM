.model small
.stack 100h
.data
crlf db 13, 10, '$'
string db 100 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov es, ax
    lea di, string
    nhap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je inra
        cmp al, 'a'
        jb luu
        cmp al, 'z'
        ja luu
        
        sub al, 32
        stosb
        jmp nhap
    
    luu:
        stosb
        jmp nhap
    
    inra:
        mov byte ptr [di], '$'
        lea dx, crlf
        mov ah, 9
        int 21h
        
        lea dx, string
        mov ah, 9
        int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main