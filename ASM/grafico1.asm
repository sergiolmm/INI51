.MODEL small 
.STACK 100h
.DATA
    mensagem DB 'Alo Mundo', 13, 10, '$'
.CODE
start:
    mov ax,@data
    mov ds,ax
  
mov ax, 0013h
int 10h

push 10
push 30
push 40
push 0ch
call drawSquare

push 20
push 80
push 30
push 06h
call drawSquare

push 200
push 100
push 60
push 09h
call drawSquare


    mov ah,4Ch 
    int 21h

;X          +0ah
;Y          +08h
;Size       +06h
;Color      +04h
drawSquare:
 push bp
 mov bp, sp

 

 mov ax, WORD [bp+04h]   
 mov ah, 0ch                ;AH = 0ch, AL = Color

 xor bx, bx                 ;Page 0
 mov dx, WORD [bp+08h]      ;DX = Y coord

 mov si, WORD [bp+06h]      
 mov di, si
 add di, dx                 ;DI = Size + Y
 add si, WORD [bp+0ah]      ;SI = Size + X

__ds_drawSquare:
  mov cx, WORD [bp+0ah]     ;CX = X Coord

___ds_drawRow:

   int 10h

   add cx, 01h              ;Increment X coord
   cmp cx, si
  jb ___ds_drawRow          ;Stay in the same row if X < Initial X + Size 

  add dx, 01h               ;Increment Y coord
  cmp dx, di
 jb __ds_drawSquare         ;Keep drawing rows if Y < Initial Y + Size

 
 pop bp
 ret 08h

END start