SECTION .data

x: dd 32
y: dd 50

msg1: db "X is greater than Y",10,0
msg2: db "Y is greater than X",10,0

SECTION .bss

SECTION .text

extern printf
global main