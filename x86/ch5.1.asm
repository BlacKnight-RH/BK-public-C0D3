INCLUDE Irvine32.inc
.data

str1 byte "hello", 0 ; 0dh,0ah,0
str2 byte "Please enter string",0    ;5 dup(0)
var1=35
var2 dword 1234h
		
.code
main PROC
	
    comment $
	call Clrscr
	mov  eax,500
	call Delay
	$

	comment $
	mov edx, offset str1
	call writestring 
	call crlf
	call writestring
	$
	
	comment $
	mov eax, var1
	call writebin
	call crlf
	call writedec
	call crlf
	call writehex
	call crlf
	$

	comment $
	mov ecx,sizeof str2
	mov edx, offset str2
	call msgbox
	call readstring ;add 0 by defult
	call writestring
	$
	
	comment $
	inst: 
	mov eax, 12345678h
	call randomrange
	call writeint
	$

	comment $
	mov esi, offset inst
	mov ecx, 32
	mov ebx, 1 
	call dumpmem
	$

	comment $
	mov esi, offset var2
	mov ecx, 32
	mov ebx, 2 
	call dumpmem
	$
	
			
	call dumpregs
	exit
main ENDP

END main
