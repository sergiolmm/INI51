; manipulando memoria de video
; 0B800h -> endereço da memoria de video
; WORD -> parte baixa caracter a ser escrito
;      -> parte alta atributo do caracter (cor exemplo)

.model small
.stack 100h
.DATA 
.CODE 
start:
    ;acessando memória de Video do DOS
    mov  ax, 0B800h ; -> endereço da memoria de video
    mov  es, ax     ; colocar ele em ES
    xor  di,di      ; zera o ponteiro da memoria de video ES:DI

    ; colocando um caracter e seu atributo
    mov  ah, 4      ; muda atributo do caracter (red)
    mov  al, "C"    ; coloca o valor a ser mostrado (caracter a ser exibido)
    mov  [es]:di, ax  ; move para a posicao de memoria ES:DI 
    ADD  DI,2
    mov  ah, 1      ; muda atributo do caracter (BLUE)
    mov  al, "1"    ; coloca o valor a ser mostrado (caracter a ser exibido)
    mov  [es]:di, ax  ; move para a posicao de memoria ES:DI 
    ;; USANDO INSTRUÇÕES MAIS COMPLEXAS
    ADD  DI,2
    MOV  AH,2
    MOV  AL, "*"
    CLD  
    STOSW 
    STOSW  
    MOV  AH,5
    MOV  AL, ">"
    MOV  CX,20      ; COLOCA O VALOR DE 20 NO REGISTRADO CX USADO COMO CONTADOR
    rep  STOSW

    mov di, 120
    MOV  CX,20      ; COLOCA O VALOR DE 20 NO REGISTRADO CX USADO COMO CONTADOR
    rep  STOSW

    mov  di, 400
    MOV  CX,20      ; COLOCA O VALOR DE 20 NO REGISTRADO CX USADO COMO CONTADOR
    rep  STOSW

    mov  di, 3100
    MOV  CX,20      ; COLOCA O VALOR DE 20 NO REGISTRADO CX USADO COMO CONTADOR
    rep  STOSW

    mov  di, 600
    MOV  CX,20      ; COLOCA O VALOR DE 20 NO REGISTRADO CX USADO COMO CONTADOR
    rep  STOSW









    mov ax, 4C00h
    int 21h
end start