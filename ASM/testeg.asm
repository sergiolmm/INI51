BITS 16

ORG 100h

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