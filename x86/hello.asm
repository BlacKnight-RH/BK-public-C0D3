; test 101

   .MODEL small
   .STACK 100h
   .DATA
HelloMessage DB 'Hello, world',13,10,'$'
   .CODE
   .startup
   mov  ax,@data
   mov  ds,ax                  ;set DS to point to the data segment
   mov  ah,9                   ;print string function
   mov  dx,OFFSET HelloMessage ;point to "Hello, world"
   int  21h                    ;display "Hello, world"
   mov  ah,4ch                 ;terminate program function
   int  21h                    ;terminate the program
   END