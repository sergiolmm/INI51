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

    msg_maior   DB  'Maior', 0dh, 10,'$' 
    msg_menor   DB  'Menor', 0dh, 10,'$' 
    
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

    ; compara se letra digitada é maior ou menor
    ; que a letra que representa o meio do alfabeto
    
    cmp     al, 'm'
    ja      MAIOR
    mov     dx, offset msg_menor
    jmp     escreve

MAIOR:
    mov     dx, offset msg_maior
escreve:
    mov     ah,9
    int     21h




    ; chama função do DOS para sair do programa
    ; liberando memoria e voltando ao prompt do S.O.
    mov     al,  0     ; return code 0 success  outro valor erro
                       ; 1 saida via control break
                       ; 2 saida com erro critico
                       ; 3 termina e continua residente ( na memoria ) 

    mov     AH, 4Ch
    int     21h

end start       ; define o ponto final do codigo, neste caso.