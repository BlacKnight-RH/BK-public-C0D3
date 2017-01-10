INCLUDE Irvine32.inc

.data
bVar byte 01,02,03
wVar word 1122

.code
main PROC

	;indirect addressing
    mov eax, offset bVar ;usually esi,edi are used
	mov bl, [eax]
    
    mov bx, [eax]
    ;mov cx, var1
	inc eax
	;inc [eax]

	
	;comment $
	mov ecx, lengthof bVar
	mov esi, offset bVar
	mov eax,0
	L:
		add al, byte ptr [esi]
		inc esi
	loop L
	;$
		
	
	
	call dumpregs
	
	;comment $
	mov esi, offset bVar
	mov ecx, 32
	mov ebx, 1
	call dumpmem
	;$
	

	exit
main ENDP

END main