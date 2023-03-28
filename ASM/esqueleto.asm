
.MODEL small
.STACK 100h
.DATA 


.CODE 
inicio:
    
    mov ax, @data
    mov ds, ax 




    mov al, 0
    mov ah, 4CH
    int 21h

end inicio 

