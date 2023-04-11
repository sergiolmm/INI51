;  Exemplo de uso de procedimento em assembler
;
;  exemplo 1:
;     procedimento para imprimir uma frase
;     declaração no fim do código
;  exemplo 2:
;       procedimento sem ret.... (isso é um erro) 
;  exemplo 3:
;       procedimento no inicio do codigo
;
;  Atividade:
;       Criar um procedimento que leia um caracter lido 
;       Criar um procedimento que escreva um caracter lido.



.MODEL small
.STACK 100h
.DATA 
    tam DB 10
    msg DB '9876543210','$'

.CODE 
inicio:
    jmp setmem

; procedimento com passagem de parametro pela pilha
; usando si como indice para poder caminha na pilha (vetor)
ordena PROC
    mov bx, offset msg
    mov si, 1
    mov di, 0

inicioOrdenacao:    
    mov al, byte ptr [bx+si]
    mov ah, byte ptr [bx+di]
    ; compara lento com rapido
    cmp ah, al
    jl  andaRapido
    ; troca os valores usando cl como auxiliar
    mov cl, al  ; há uma solução sem uso de auxiliar qual???
    mov al, ah
    mov ah, cl
    mov byte ptr [bx+si], al
    mov byte ptr [bx+di], ah

andaRapido:
    cmp si , 9
    je  andaLento
    inc si
    jmp inicioOrdenacao

andaLento:    
    inc di
    mov si, di
    inc si     
    cmp di, 9
    je  fimOrdenacao
    jmp inicioOrdenacao

fimOrdenacao:    
    ret 

ordena ENDP



setmem:
    mov ax, @data
    mov ds, ax 

    call ordena

    mov al, 0
    mov ah, 4CH
    int 21h


imprime PROC  
    LOCAL a: byte  ; declaração local de variavel 
    lea bx, offset a    ; obtenho o endereço real
    mov byte ptr [bx], 65        ; muda o valor 

    mov dx, offset msg
    
    mov al, byte ptr [bx]
    mov bx, dx
    mov byte ptr [bx], al
    mov ah, 09
    int 21h

    ret
    

imprime endp



end inicio 

