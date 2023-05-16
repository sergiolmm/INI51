;;
; Leitura do teclado não blocante usando
; a int 21h funcao ah 06h e dl=0FFh
;
;;
.model small
.stack 100h
.data

.code

start:
    ; inicializar o registrador ES com o endereço do vídeo B800h
    mov ax, 0B800h
    mov es, ax
    ; usaremos o registrador di como ponteiro para as posições
    ; da memória de vídeo.
    xor di,di
    ; lembrando na memoria de video
    ; ah -> atributo do caracter
    ; al -> caracter.
    mov si, 240 ; na terceira linha
    mov ax, 042Ah
 inicio:
    mov ah, 04h
    ; di com valor 0 coordenada 0,0 
    ; se uma linha tem 80 caracteres por exemplo para a linha 1
    ; devemos colocar di em que valor?
    ; di = di + 80 * 2
    mov di, si
    mov [es]:di, ax

    ; ler dados do teclado sem ser auto blocante.
    mov ah, 06h
    mov dl, 0FFh 
    int 21h
    ; se ZF set nenhum caracter foi digitado
    ; se ZF clear (0) caracter digitado e valor em AL
    jz  inicio_1
    cmp al,'a'
    je  inc_di
    cmp al,'s'
    je  dec_di

    cmp al, 01Bh  ; compara se digitou ESC para sair
    je  fim
    jmp inicio
inicio_1:
    mov al, 25h
    jmp inicio
inc_di:
    add si,80
    jmp inicio

dec_di:
    sub si,40
    jmp inicio

fim:
    mov ax, 4C00h
    int 21h

end start
