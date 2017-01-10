bits 16 
org  0x7c00

jmp main 

HelloMessage db "Hello From my bootloader - booting under low-level x86 arch.",0x0
AuthMessage db "proudly Made by : BlacKnigh | Ma7moud Magdy." , 0x0
AnyKey db "Press any key to reboot ...", 0x0

println:
	lodsb
	or al , al 
	jz complete
	mov ah , 0x0e
	int 0x10
	jmp println

complete:
	call printNwL

printNwL:
	mov al ,0
	stosb
	
	mov ah , 0x0E
	mov al , 0x0D
	int 0x10 
	mov al , 0x0A
	int 0x10 
	ret
	
Reboot:
	mov si,AnyKey
	call println
	call GetPressedKey
	
	db 0xea
	dw 0x0000
	dw 0xffff
	
GetPressedKey:
	mov ah , 0
	int 0x16
	ret
	
main:
	cli
	mov ax , cs 
	mov ds ,ax
	mov es , ax
	mov ss , ax
	sti 
	
	mov si , HelloMessage
	call println
	
	mov si , AuthMessage
	call println
	
	call printNwL
	call printNwL
	
	call Reboot
	
	times 510 - ($-$$) db 0 
	dw 0xAA55