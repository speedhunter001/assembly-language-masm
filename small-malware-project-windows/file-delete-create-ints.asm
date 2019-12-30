INCLUDE Irvine16.inc

.data
	filename BYTE "test.exe",0

.code
	main PROC
		mov ax, @data
		mov ds, ax
		
		;Creating a file
		;mov ah, 3ch
		;mov cx, 00000000b
		;mov dx, OFFSET filename
		;int 21h
		
		;Deleting a file
		;mov ah, 41h
		;mov dx, OFFSET filename
		;int 21h
		;call Writestring

		exit
	main ENDP
END main