INCLUDE Irvine32.inc

.data
	jz_array BYTE 5 DUP(0), 1
	jnc_array BYTE 4 DUP(3), 0

.code
	main PROC

	;Run loop until destination is greater than source
	xor eax, eax
	mov ecx, 0
	jump_until_dest_greater:
		inc ecx
		call Writeint
		mov al, [jnc_array+ecx]
		cmp al, [jz_array+ecx]
	JG jump_until_dest_greater

	exit
	main ENDP
END main