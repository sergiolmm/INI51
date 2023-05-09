.model small
.stack 100h
.code

start:

    mov ax,0B800h 	; segmento do buffer de vídeo
    mov es,ax 	; coloca em es
    xor di,di 	; zerar di, ES:DI aponta para memória vídeo
    mov ah,4 	; atributo - vermelho
    mov al,"G" 	; caracter para colocar lá
    mov [es]:di, ax
    add di,2
    mov ah,1
    mov al,"0" 	; caracter para colocar lá
    mov [es]:di, ax
    add di,2
    mov ah,2
    mov al,"*" 	; caracter para colocar lá
    cld 
    stosw
    stosw
    
    mov ax,4C00h 	; retornar para o DOS
    int 21h

end start