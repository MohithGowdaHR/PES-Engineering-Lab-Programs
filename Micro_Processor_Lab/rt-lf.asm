; Display 4321 from right to left

data segment
pctrl equ 0c803h
pc equ 0c802h
pb  equ 0c801h
code1 db 0ffh,0ffh,0ffh,0ffh,99h,0b0h,0a4h,0f9h


data ends
code segment
      assume cs:code,ds:data
            start:mov ax,data
                  mov ds,ax
                  mov dx,pctrl
                  mov al,80h
                  out dx,al
                  mov cl,05h
                  mov si,offset code1
            top:  add si,03
                  call display
                  call delay
                  add si,02
                  dec cl
                  jnz top
                  mov ah,4ch
                  int 21h

             display proc near
                  mov bh,04h
           top1:  mov bl,08h
                  mov al,[si]
           top2:   rol al,01
                  mov ch,al
                  mov dx,pb
                  out dx,al
                  mov al,00h
                  mov dx,pc
                  out dx,al
                  mov al,0ffh
                  mov dx,pc
                  out dx,al
                  mov al,ch
                  dec bl
                  jnz top2
                  dec si
                  dec bh
                  jnz top1
                  ret
                  display endp

                 delay proc near
                 push bx
                 mov di,0ffffh
           t:    mov bx,0ffffh
           t1:   dec bx
                 jnz t1
                 dec di
                 jnz t
                 pop bx
                 ret
          delay endp
          code ends
          end start
