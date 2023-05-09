; programa 
;
;
.model small
.stack 100h
.DATA
    Text DB "Este e um texto",13,10,"$"
    Text1 DB "Este e um texto2$"
.CODE
start:
    
    mov  ax, @data
    mov  ds, ax

    mov  dh, 12   ; coluna
    mov  dl, 32   ; linha
    mov  ah, 02h  ; move o cursor
    xor  bh, bh   ; pagina de video 0
    int  10h

    mov  dx, OFFSET Text            
    mov  ah,9
    int  21h

    mov  dh, 5   ; coluna
    mov  dl, 23   ; linha
    mov  ah, 02h  ; move o cursor
    xor  bh, bh   ; pagina de video 0
    int  10h

    mov  dx, OFFSET Text1
    mov  ah,9
    int  21h

    mov  dh, 25   ; coluna
    mov  dl, 2   ; linha
    mov  ah, 02h  ; move o cursor
    xor  bh, bh   ; pagina de video 0
    int  10h


    mov  ax,4C00h  ; termina o programa
    int  21h

    

end start