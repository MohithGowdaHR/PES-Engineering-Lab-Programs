; 00-99
data segment
pb  equ  0c881h
pc  equ  0c882h
pctrl  equ  0c883h
table  db 0c0h,0cfh,0a4h,0b0h,99h,92h,82h,0f8h,80h,90h
code1 db 4 dup(0)
data ends


code segment
assume cs:code,ds:data
start:mov ax,data
      mov ds,ax
      mov al,82h
      mov dx,pctrl
      out dx,al
      mov dh,00h
     top1: mov dl,00h
 again:       mov si, offset code1
       mov al,dl
       mov bx,offset table
       xlat
       mov[si],al
       inc si
       mov al,dh
       xlat
       mov [si],al
       inc si
       mov byte ptr[si],0ffh
       inc si
       mov byte ptr[si],0ffh
       lea si,code1
       call display
       call delay
       inc dl
       cmp dl,0ah
       jle again
       inc dh
       cmp dh,0ah
       jle top1


        mov ah,4ch
        int 21h
        display proc near
        push dx
        mov bh,04
     top:mov bl,[si]
         mov cl,08
   again1:rol bl,01
         mov al,bl
         mov dx,pb
         out dx,al
         mov dx,pc
         mov al,0ffh
         out dx,al
         mov al,00h
         out dx,al
         dec cl
         jnz again1
         inc si
         dec bh
         jnz top
         pop dx
         ret
         display endp
         delay proc near
         push cx
         push bx
         mov cx,0ffffh
      t2:mov bx,1234h
      t1:dec bx
         jnz t1
         dec cx
         jnz t2
          pop bx
         pop cx
         ret
         delay endp
code ends
end start

