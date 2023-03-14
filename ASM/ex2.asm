.MODEL small 
.STACK 100h
.DATA
    mensagem DB 'imprime caracter', 13, 10, '$'    
    msg2     DB 'Entrou if', 13, 10, '$'
    
    msg3     DW 'N','O','V','0'

.CODE
start:
    mov ax,@data
    mov ds,ax
    mov ah,9    
    mov dx, OFFSET mensagem 
    int 21h

    ; imprime um caracter
    mov ah, 02h
    mov dl, 'R'
    int 21h

    mov bx, offset msg2

    mov cl, 4 
inicio:
    mov   dl, [bx]   ; ponteiro da string msg2
    mov   ah, 02h
    int   21h
    inc   bx
    dec   cl
    jnz   inicio    

;  msg3     DW 'N','O','V','0'
    mov   cl, 4
    mov   bx, offset msg3
inicio2:    
    ;mov   dl, [bx]
    mov   dx, word ptr [bx]
    mov   ah, 02h
    int   21h
    inc   bx
    inc   bx
    dec   cl
    jnz   inicio2    

; teste..


fim:            ; label utilizado na comparação 
    mov ah,4Ch 
    int 21h
end start