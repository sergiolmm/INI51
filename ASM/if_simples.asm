.MODEL small 
.STACK 100h
.DATA
    mensagem DB 'IF Simples', 13, 10, '$'    
    msg2     DB 'Entrou if', 13, 10, '$'
.CODE
start:
    mov ax,@data
    mov ds,ax
    mov ah,9    
    mov dx, OFFSET mensagem 
    int 21h

    ; if é uma comparação
    mov al, 11
    cmp al, 10
    je  fim
    mov ah,9          ; imprime texto terminado com $
    mov dx, OFFSET msg2 ; chamada do SO (DOS).
    int 21h           ; interrupção do DOS 


fim:            ; label utilizado na comparação 
    mov ah,4Ch 
    int 21h
end start