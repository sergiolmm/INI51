.model small
.stack 100h
.code

start:

    mov ax,0B800h 	; segmento do buffer de vídeo
    mov es,ax 	; coloca em es
    xor di,di 	; zerar di, ES:DI aponta para memória vídeo
    mov ah,4 	; atributo - vermelho
    mov al,"G" 	; caracter para colocar lá
    mov cx,4000 	; quantidade de vezes que deve escrever
    cld 		; direção - para a frente
    rep stosw 	; escreve caracter em ES:[DI]

    mov ax,4C00h 	; retornar para o DOS
    int 21h

end start