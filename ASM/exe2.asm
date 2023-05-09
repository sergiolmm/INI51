; programa 
;
;
.model small
.stack 100h
.DATA
    Text DB "Este e um texto",13,10,"$"

.CODE
start:

    mov  ax, @data
    mov  es, ax

    mov bp,OFFSET Text 	; ES:BP aponta para a mensagem
    mov ah,13h 		; função 13 - escrever string
    mov al,01h 		; atributo em bl,move cursor
    xor bh,bh 		; página de vídeo 0
    mov bl,5 		; atributo - magenta
    mov cx,17 		; comprimento da string
    mov dh,5 		; linha para colocar a string
    mov dl,5 		; coluna para colocar a string
    int 10h 		; chamada de serviço bios
   
    mov bp,OFFSET Text 	; ES:BP aponta para a mensagem
    mov ah,13h 		; função 13 - escrever string
    mov al,01h 		; atributo em bl,move cursor
    xor bh,bh 		; página de vídeo 0
    mov bl,4 		; atributo - red
    mov cx,17 		; comprimento da string
    mov dh,16 		; linha para colocar a string
    mov dl,16 		; coluna para colocar a string
    int 10h 

    mov  ax,4C00h  ; termina o programa
    int  21h

end start