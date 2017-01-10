INCLUDE Irvine32.inc

.data

myArray byte 1,2,3
sum byte 0

.code
main PROC
	
    
    ;mov esi,0Ah
	;mov ecx,0Bh

	call arraySum
		
	;print::
	movzx eax,sum
	call writedec 
	call crlf	
	
	call dumpregs

	exit
main ENDP

arraySum Proc ;uses esi ecx
	
	mov ecx, lengthof myArray
	mov esi, offset myArray
	mov al,0
	l1:
		add al, byte ptr [esi]
		inc esi
	loop l1
	mov sum,al
	
	;jmp print

	ret
arraySum ENDP

END main

