;----------------------------------------------------------------------------
; unsigned: ja, jae, jna, jnae     
;			jb, jbe, jnb, jnbe
; j=jump, a=above, b=below, e=equal, n=not

; signed: jg, jge, jng, jnge
;		  jl, jle, jnl, jnle
; j=jump, g=greater, l=less e=equal, n=not

; conditional: jz, jnz ; 
; j=jump, z=zero, n=not
;-----------------------------------------------------------------------------


INCLUDE Irvine32.inc

.data

successStr BYTE "Success"
BYTE 0ah,0dh,0

foundStr BYTE "Found"
BYTE 0ah,0dh,0

notFoundStr BYTE "Not Found"
BYTE 0ah,0dh,0

intArray byte 0,0,0,0,1,20,35,-12,66,4,0

setX byte 00101100b
setY byte 01001010b

.code
main PROC
	
	;----------------------- try the jump instruction
	comment $
	mov eax, -3
	cmp eax, 2
	jg l1

	exit

	l1: mov edx, offset successStr
		call writestring 
	$
	
	;================================================= applications 
	
	;------------------------ loop until a key pressed
	comment $
	L1: mov eax,10		; create 10ms delay
		call Delay
		call ReadKey	; read character into al (ReadKey sets the zero flag if no key pressed)
	
	jz L1				; repeat if no key
	call writechar		; print character in al
	$

	;------------------------ search array for an item
	; intArray sbyte 0, 0, 0, 0, 1, 20, 35, 12, 66, 4, 0
	comment $
	mov esi, offset intArray
	mov ecx, lengthof intArray
	l1: 
		cmp byte ptr [esi], 20
		jz Found
		inc esi
	loop l1
		jmp notFound
	
	Found: mov edx, offset foundStr
		   call writestring
		   exit
	notFound: mov edx, offset notFoundStr
			call writestring
			exit
    $

	;--------------------------- modify the last program with the following insted of cmp and jz
		;.if (byte ptr [esi] == -20) 
		;	jmp Found
		; .endif

	call dumpregs
	exit
main ENDP
END main

