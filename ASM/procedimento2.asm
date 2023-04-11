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
    msg DB 'Procedimentos são legais...', 13,10,'$'

.CODE 
inicio:
    jmp setmem

imprime2 PROC
    
    mov dx, offset msg
    mov ah, 09
    int 21h

    ret

imprime2 ENDP


contaLetra PROC
    mov bp, sp
    add bp,2
    mov bx, [bp]
    inc bl
    mov [bp], bx

    ret 
contaLetra ENDP
; procedimento com passagem de parametro pela pilha
; usando si como indice para poder caminha na pilha (vetor)
contaLetra2 PROC
    mov bp, sp
    mov si,2
    mov bx, [bp+si]
    inc bl
    mov [bp+si], bx

    ret 
contaLetra2 ENDP



setmem:
    mov ax, @data
    mov ds, ax 

    call imprime
    call imprime2

    ; passando parametro pela pilha
    mov al, 'A'
    mov ah, 'A'    
    push ax
    call contaLetra
    pop  cx 

    mov al, 'c'
    mov ah, 'c'    
    push ax
    call contaLetra2
    pop  cx 



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

