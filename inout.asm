; nasm -f elf -o inout.o inout.asm
; ld -o inout inout.o
section .data
	usrPrompt: db "Please enter a number: "
	lenUsrPrompt equ $-usrPrompt

	displayMsg: db "The number that you entered was: "
	lenDisplayMsg equ $-displayMsg

	greaterThanTen: db "The number is greater than ten."
	gttLen equ $-greaterThanTen

	number: dd 3

section .bss
	num resb 5					;Variable for storing the input from the user

section .text
	global _start
	_start:
		mov eax,4				;Printing the prompt for the user
		mov ebx,1
		mov ecx,usrPrompt
		mov edx,lenUsrPrompt
		int 80h

		mov eax,3				;Accept and save the user input
		mov ebx,2
		mov ecx,num
		mov edx,5
		int 80h

		mov eax,4				;Output the message for the number entered
		mov ebx,1
		mov ecx,displayMsg
		mov edx,lenDisplayMsg
		int 80h

		mov eax,4				;Output the number that was entered
		mov edx,1
		mov ecx,num
		mov edx,5
		int 80h

		mov eax,num ;DWORD [number]	;Adding a condition: Is the number greater than 10?
		cmp DWORD [eax],'10'
		jg .numIsGreaterTen
		jmp .done				;Used to make the program skip to the .done section and skip the greater than 10 condition if false
	.numIsGreaterTen:
		mov eax,4
		mov ebx,1
		mov ecx,greaterThanTen
		mov edx,gttLen
		int 80h

		.done:

		mov eax,1 	;Exit
		mov ebx,0
		int 80h