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
    lea si, string
    mov cx, 0
    cld ; chi lam viec voi al va di
    
    nhap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je ketthuc
        
        stosb
        inc cx
        jmp nhap  
        
    ketthuc:
        mov byte ptr [di], '$'
        
        cmp cx, 1
        je inra
        
        dec di
        
    daoxau:
        cmp di, si
        jbe inra
        
        mov al, [di]
        mov bl, [si]
        mov [si], al
        mov [di], bl
        dec di
        inc si
        
        jmp daoxau
        
    inra:
         add di, cx
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