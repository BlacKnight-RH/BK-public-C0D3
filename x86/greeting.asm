;|=====================================================
;|		By Black Knight : asm x86 -nasm- 
;|=====================================================
;|

global _start 

section .data 
	msg1        db "Hello "
	user_input  times 20 db 0 

 
section .bss 

section .text 

_start : 
	
	; read 
	mov eax , 3             ; syscall read  
	mov ebx , 0             ; df 0 -first arg-
	mov ecx , user_input    ; buff -second arg-
	mov edx , 20            ; size -third arg-
	int 0x80

	; write 
	mov eax , 4
	mov ebx , 1
	mov ecx , msg1
	mov edx , 6
	int 0x80
	
	mov eax , 4 
	mov ebx , 1
	mov ecx , user_input
	mov edx , 20
	int 0x80
	
	; exit 
	mov eax , 1
	mov ebx , 0
	int 0x80
