INCLUDE Irvine32.inc

.data

str0 byte "Hello"
byte 0ah,0dh,0

.code
main PROC
		
	mov ecx, esp
	
	mov eax, 0
	mov ah,1
	mov al,2
	
	comment $
	;push ah
	push ax
	;push eax
	;push 5
	
	;pushfd ;flags
	;pushf ;16 bit
	;push count

	call dumpregs
    print:
	mov esi, esp
	sub ecx,esi 
	mov ebx, 1
	call dumpmem
	$

	;-------------------------
	;call dumpregs
	pushad ;EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI inorder

	;popad ;general purpose registers poped in reverse order
	;call dumpregs
	
	comment $
    print:
	mov esi, esp
	sub ecx,esi  
	mov ebx, 1
	call dumpmem
	call dumpregs
	$

	;-----------------------
	; reverse string
	comment $
	mov al,'G'
	mov esi, offset str0
	mov ecx, lengthof str0
	strpoint1:
		mov ah, [esi]
	    push ax
		inc esi		
	loop strpoint1
	
	mov esi, offset str0
	mov ecx, lengthof str0
	strpoint2:
		pop ax
	    mov [esi],ah
		inc esi
	loop strpoint2
	
	call clrscr;
	mov edx,offset str0
	call writestring
	$

	;-----------------------------
	;nested loop with push and pop
	
	comment $
	mov ecx, 3
    outer:
		mov ebx,ecx ;push ecx
		mov ecx,5 
		mov eax,1
	    inner:
			call crlf
			call writeint
			inc eax
		loop inner
		call crlf
		mov ecx,ebx ;pop ecx
	loop outer
	$


	exit
main ENDP
END main