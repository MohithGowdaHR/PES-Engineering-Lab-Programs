;stepper motor
  data segment
	
        n dw 0005
       pc equ 0c882h
       pctrl equ 0c883h
  data ends

  code segment
	assume cs:code,ds:data
	 start: mov ax,data
		mov ds,ax
		mov al,80h  ;Move control word 
			    ;to al
		mov dx,pctrl
		out dx,al   ;Contents of al is
			    ;moved to o/p port C
		mov cx,n
		mov al,0eeh 
				
		mov dx,pc
	 t1:    out dx,al
		call delay

		rol al,1 
			 

		dec cx
		jnz t1
                mov cx,n
                mov al,77h
                mov dx,pc
          t2:   out dx,al
                call delay
                ror al,1
                dec cx
                jnz t2
                   mov ah,4ch
		int 21h

	  delay proc near
              mov si, 0ffffh
       t4:     mov di,0ffffh
	t5:     dec di
		jnz t5
		dec si
		jnz t4
		ret
	   delay endp
code ends 
end start


	

		

		

