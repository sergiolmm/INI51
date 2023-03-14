.MODEL small 
.STACK 100h
.DATA
    mensagem DB 'Alo Mundo', 13, 10, '$'
.CODE
    mov ax,@data
    mov ds,ax
    mov ah,9    
    mov dx, OFFSET mensagem 
    int 21h
    mov ah,4Ch 
    int 21h
END