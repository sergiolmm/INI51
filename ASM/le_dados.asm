; Aula dia 28-03-23
; 
; Objetivos:
;   Ler uma sequencia de caracteres e trabalhar com acesso a memoria
;   uso de lacos de repetição 
;   fazer o saida da sequencia na tela.

; uso da funcao 0Ah da int 21h 
; -> Read buffered array from standard input 
; como é a estrutura do buffer
;   primeiro byte indica o tamanho maximo de caracters
;   segundo  byte indica quanto foi lido
;   terceiro byte até o maximo definido no 1 byte dados lidos

; dica -> para imprimir frase deve terminar com $

.MODEL small
.STACK 100h
.DATA 

dados db    10,?, 10 dup (?)

.CODE 
inicio:
    
    mov ax, @data
    mov ds, ax 

    mov ah, 0Ah 
    mov dx, offset dados
    int 21h 
; imprimir na tela os dados lidos do teclado....


    mov bx, offset dados
    mov di, bx
    add bx, 1   ; ajusta ponteiro 
    mov ch, 0
    inc di
    mov cl, [di]
    add bx, cx
    inc di
ini1:    
    mov al, [bx]
    mov ah, [di]
    cmp al, ah
    je  fim 
    inc di
    dec bx
    jmp ini1
; ha erro mas é para teste de debug
fim:
    mov al, 0
    mov ah, 4CH
    int 21h

end inicio 


