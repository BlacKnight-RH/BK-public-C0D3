;----------------------------------------------------------------------------
;	bitwise operation 
;	and, or, not, xor
;	test, cmp  (no effect over destination)
;   All except (cmp) clear the overflow and carry flag and set sign, zero, and parity flag
;-----------------------------------------------------------------------------


INCLUDE Irvine32.inc

.data

array BYTE "Upper"
BYTE 0ah,0dh,0

setX byte 00101100b
setY byte 01001010b

.code
main PROC
	
    ;---------------------- and to clear a bit
	;A = 41h (0100 0001) , a= 61h (0110 0001)
	;B = 42h (0100 0010) , a= 62h (0110 0010)
	comment $
	mov ecx,LENGTHOF array
	mov esi,OFFSET array
	L1: 
		and BYTE PTR [esi], 11011111b   ;clear bit 5
		inc esi
	loop L1
	mov edx, offset array
	call writestring
	$

	;---------------------- or to set a bit
	; to set the bit in poistion 2 
	;comment $
	mov al,0
	or al, 00000100b
	;$

		
	;---------------------- bit map sets
	;setX= 00101100b
    ;setY= 01001010b
	comment $
	mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,0
	
	; and to check membership of bit 2 by clearing zero-flag 
	mov al, setX 
	and al, 00000100b     ;al=00000100b=04h
    
	; and also can be used for sets intersection
	mov bl, setX
	and bl, setY          ;bl=00001000b=08h
	
	; or used for sets union 
	mov cl, setX          
	or cl, setY           ;cl=01101110b=6Eh
	
	; not used to complement a set 
	mov dl, setX
	not dl                ;dl=11010011b=D3h
	$

	;---------------------- XOR
	; can be used to clear variables 
	comment $
	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx

	;xor effect the parity flag 
	; Intel 32 set the barity flag for even number of 1s and clear the flags for odd number of 1s (in the lowest byte)
	; we can test parity by xor with zero
	mov al, 00111101b      ; even no. of 1s -> pf=1
	xor al, 00000000b
	$

	
	;================================================================================================================

	;------------------------ test
	; test is "and" but doesn't effect the destination 
	comment $
	xor eax,eax
	mov al, 00110101b  ;al=35h
	test al, 0
	$


	;------------------------- cmp
	;cmp d,s -> d= d-s
	; if d<s -> d= -   ->sign flag set
	; if d>S -> d= +   ->sign flag clear
	; if d=s -> d= 0   ->zero flag set


	;-------------------------  individual flags
	; zero flag
	;test al, 0

	; carry flag
	;stc
	;clc


	call dumpregs
	exit
main ENDP
END main

