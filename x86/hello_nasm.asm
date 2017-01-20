;|=====================================================
;|		By Black Knight : asm x86 -nasm- 
;|=====================================================
;|

section .data 
	msg db "Hello world !" , 0x0a
	
section .text 
global _start 
	
_start :
	
	mov eax , 4     ; systemCall write 
	mov ebx , 1     ; fd         -first arg-
	mov ecx , msg   ; buff       -second arg-
	mov edx , 16    ; buff size  -third size- 
	int 0x80        ; make sysCall
	
	mov eax , 1     ; systemCall exit 
	mov ebx , 0     ; success code -first arg-
	int 0x80        ; make sysCall
