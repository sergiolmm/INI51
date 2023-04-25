.MODEL small
.STACK 100h

.DATA 
    buffer  db 6 dup('$')  ; onde vou guardar o resultado
    pula    db 13,10,'$'   ; faz o \r\n  (pula linha)

.CODE  
start:
    ; ajusta o ponteiro para a área de dados
    mov ax, @data
    mov ds, ax 

    mov  ax, 14h
    call hex2str
    mov  ah, 09
    mov  dx, offset buffer
    int  21h



    ; finaliza o programa e sai para o prompt
fim:
    mov ah, 4Ch
    int 21h 

; ----- Inicio dos procedimentos ------------------
limpa_buffer proc 
    lea si, buffer  ; inicializa o ponteiro (SI) o qual aponta para buffer
    mov al, '$'
    mov cx, 5   ;
limpar:
    mov [si], al    ; atualiza o valor 
    inc si          ; anda com o ponteiro para a proxima posição
    loop limpar     

    ret 
limpa_buffer endp 

; HEX to STRING
; procedimento para conversao de numero hex para string (decimal)
; AX -> numero hexa a ser convertido
; buffer -> onde esta a string do valor convertido

hex2str proc
    mov bx, 10   ; divisor
    mov cx, 0    ; contador de digitos extraidos
clico1:
    mov  dx,0     ; parte alta da divisão nesta caso 0
    div  bx       ; DX:AX / BX  onde AX quociente e DX resto
    push dx
    inc  cx
    cmp  ax, 0
    jne  clico1
    ; terminou a divisao , vamos converte o numero 
    lea  si, buffer   ; aponto si para o buffer
ciclo2:
    pop  dx
    add  dl, 48   ; converto o valor para string 
    mov  [si], dl ; carrego o digito no buffer
    inc  si
    loop ciclo2 

    ret
hex2str endp



end start