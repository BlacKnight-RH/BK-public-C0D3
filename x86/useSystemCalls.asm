.386
.model flat , stdcall 
option casemap:none 

include d:\.....\include\windows.inc    ; from masam32 ... add Valid Link
include d:\.....\include\masm32.inc     ; from masam32 ... add Valid Link 
include d:\.....\include\kernal32.inc   ; from masam32 ... add Valid Link

includelib d:\x86\masm32\m32lib\masm32.lib
includelib kernal32.lib


.data 

	message1 db "Type Your Name : " , 0 
	message2 db "Your Name is : " , 0
	
;---------------------------------------------------- 	

.data?
	
	buffer db 100 dup(?)

;----------------------------------------------------
	
.code 
	start: 
		invoke StdOut , addr message1
		invoke StdIn  , addr buffer , 100
		
		invoke StdOut , addr message2
		invoke StdIn  , addr buffer , 100
		
		invoke StdIn  , addr buffer , 100
		invoke ExitProcess , 0
		
	end start 	
	