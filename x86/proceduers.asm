include Irvine32.inc 

.data
	myarray byte 1,2,3
	sum byte 0
	
.code 
	main PROC 
	
		;mov esi , 0Ah
		;mov ecx ,0Bh
		
		call arraySum
		
		;print::
		
		movzx eax , sum 
		call writedec 
		call crlf 
		
		call dumpregs 
		exit 
	main ENDP 

	arraySum Proc ; uses esi ecx 
		
		mov ecx , lengthof myarray
		mov esi , offset myarray
		mov al,0 
		
		l1: 
			add al , byte ptr [esi]
			inc esi 
		loop l1
		
		;jmp print 
		
		ret 
	arraySum ENDP
	
	END main