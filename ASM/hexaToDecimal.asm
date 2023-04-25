.MODEL small 
.STACK 100h
.DATA
    mensagem DB 'imprime caracter', 13, 10, '$'    
    msg2     DB '                ', 13, 10, '$'
    buffer  db 6 dup('$') ;RESULT COULD HAVE 5 DIGITS.
    crlf    db  13, 10, '$'

.CODE
start:
    mov ax,@data
    mov ds,ax
   
   
    mov ah,9    
    mov dx, OFFSET mensagem 
    int 21h

    call clear_buffer
    mov     ax, 00FFh
    mov     si, offset msg2
    call    number2string

    mov ah,9    
    mov dx, OFFSET buffer
    int 21h
    call    pulalinha
    
    call clear_buffer
    mov     ax, 0009h
    mov     si, offset msg2
    call    number2string

; teste..
    mov ah,9    
    mov dx, OFFSET buffer
    int 21h
    call    pulalinha
    
    call clear_buffer
    mov     ax, 0FFFFh
    mov     si, offset msg2
    call    number2string

    mov ah,9    
    mov dx, OFFSET buffer
    int 21h
    call    pulalinha

fim:            ; label utilizado na comparação 
    mov ah,4Ch 
    int 21h


pulalinha proc
    mov ah,9    
    mov dx, OFFSET crlf
    int 21h
pulalinha endp

;---------------------------------------------  
;FILL VARIABLE "BUFFER" WITH "$".
;EVERYTIME THE USER WANTS TO DO IT AGAIN, THE
;PREVIOUS RESULT MUST BE CLEARED.

clear_buffer proc
  lea  si, buffer
  mov  al, '$'
  mov  cx, 5  
clearing:
  mov  [si], al
  inc  si
  loop clearing

  ret
clear_buffer endp

;---------------------------------------------  
;INPUT : AX = NUMBER TO CONVERT TO DECIMAL.
;        SI = OFFSET STRING.
;ALGORITHM : EXTRACT DIGITS ONE BY ONE, STORE
;THEM IN STACK, THEN EXTRACT THEM IN REVERSE
;ORDER TO CONSTRUCT STRING.

number2string proc
  mov  bx, 10 ;DIGITS ARE EXTRACTED DIVIDING BY 10.
  mov  cx, 0 ;COUNTER FOR EXTRACTED DIGITS.
cycle1:       
  mov  dx, 0 ;NECESSARY TO DIVIDE BY BX.
  div  bx ;DX:AX / 10 = AX:QUOTIENT DX:REMAINDER.
  push dx ;PRESERVE DIGIT EXTRACTED FOR LATER.
  inc  cx ;INCREASE COUNTER FOR EVERY DIGIT EXTRACTED.
  cmp  ax, 0  ;IF NUMBER IS
  jne  cycle1 ;NOT ZERO, LOOP. 
;NOW RETRIEVE PUSHED DIGITS.
  lea  si, buffer
cycle2:  
  pop  dx        
  add  dl, 48 ;CONVERT DIGIT TO CHARACTER.
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
number2string endp  


end start