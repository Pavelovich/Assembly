; Sample assembly program I made.  Used this video for guidance
; Assembled object file: nasm -f elf -o first.o first.asm
; Linked program file: gcc -o first first.o

SECTION .data

msg: db "This is a program that I have written in assembly!",10,0 	;10 is a carriage return, 0 ends the message.

SECTION .text

extern printf 	;Tells the assembler to use the printf function

global main
main:
	push ebp
	mov ebp,esp 	;sets up stack frame

	push msg
	call printf 	;print the message to the screen

	mov esp,ebp
	pop ebp
	ret 	;destroy the stack frame
