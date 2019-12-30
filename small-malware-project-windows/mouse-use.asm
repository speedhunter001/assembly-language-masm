INCLUDE Irvine16.inc

.data
	msg1 BYTE "Press mouse",0
	
.code
	main PROC
		mov ax, @data
		mov ds, ax
		
		mov ax, 0000h
		int 33h
		
		mov ax, 0001h
		int 33h
		
		mov bx, 0
		mov cx, 0
		mov dx, 0
		L:
		call clrscr
		
		mov ax, 0004h
		int 33h
		
		;mov ax, cx
		;call writedec
		;call crlf
		
		;mov ax, dx
		;call writedec
		mov ax, bx
		call writedec
		mov ax, 10000
		call delay
		;add cx, 8
		add dx, 8
		inc bx
		jmp L
		exit
	main ENDP
END main