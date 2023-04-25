; define o modelo de memoria a ser utilizado
.MODEL small

; define o tamanho da pilha (STACK) que irá ser utilizado
; no nosso caso 100h ou seja 256 posicões na pilha
.STACK 100h

; define a area de dados declarados a ser utilizada
.DATA
    msg         DB  'AULA DIA 21/03', 0dh, 10,'$' 
    ;  13 -> 0Dh  - carriged return 
    ;  10 -> 0Ah  - line feed 

    
; define a arae do código , o programa em si
; no TASM precisamos declarar um label de inicio  e 
; finalizar esse label
.CODE
start:          ;   label de inicio
    ; ajustar registrador DS para apontar a
    ; area de memoria ->  @data 
    mov     ax, @data
    mov     ds, ax 

    ; escreve uma frase via interrupção do SO
    ; no dispositivo de saida (tela)
    ; usa-se a funcao 09 da int 21h (DOS)
    ; onde o ponteiro da string é passado em dx
    mov     dx, offset msg
    mov     ah, 09
    int     21h

    mov     ah, 01
    int     21h
    mov     cl,al
    mov     ah, 01
    int     21h
    mov     ch,al


    mov     AH, 4Ch
    int     21h

end start       ; define o ponto final do codigo, neste caso.