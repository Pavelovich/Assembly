section .data
	usrPrompt: db "Please enter a number: "
	lenUsrPrompt equ $-usrPrompt
	displayMsg: db "The number that you entered was: "
	lenDisplayMsg equ $-displayMsg

section .bss
	num resb 5 	;Variable for storing the input from the user

section .text
	global _start
	_start:
		mov eax,4 	;Printing the prompt for the user
		mov ebx,1
		mov ecx,usrPrompt
		mov edx,lenUsrPrompt
		int 80h

		mov eax,3 	;Accept and save the user input
		mov ebx,2
		mov ecx,num
		mov edx,5
		int 80h

		mov eax,4 	;Output the message for the number entered
		mov ebx,1
		mov ecx,displayMsg
		mov edx,lenDisplayMsg
		int 80h

		mov eax,4 	;Output the number that was entered
		mov edx,1
		mov ecx,num
		mov edx,5
		int 80h

		mov eax,1 	;Exit
		mov ebx,0
		int 80h