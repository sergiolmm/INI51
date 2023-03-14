.MODEL small 
.STACK 100h


.DATA
    mensagem DB 'Digite algo', 13, 10, '$'
    keyData  DB 20,?,20 DUP(?)

.CODE
start:
    mov ax,@data
    mov ds,ax
    mov ah,9    
    mov dx, OFFSET mensagem 
    int 21h
    ; LE STRING DO TECLADO ATE DIGITAR ENTER
    mov ah, 0Ah
    mov dx, offset keyData
    int 21h
    ; PULA DUAS LINHAS
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h

    ; ESCREVE O QUE FOI DIGITADO...
    mov bx, offset keyData
    inc bx
    mov cl, [bx] ; quantidade lida
    inc bx
loop1:
    mov dl, [bx]
    mov ah, 02h
    int 21h
    inc bx
    dec cl
    jne  loop1

    mov ah,4Ch 
    int 21h
end start