INCLUDE Irvine32.inc

.data
	first_last_clear BYTE 10011001b
	x_char BYTE 'x', 0
	z_char BYTE 'Z', 0
	num BYTE 10
	jz_array BYTE 5 DUP(0), 1
	jg_array BYTE 5 DUP(3), 0

.code
	main PROC

	xor eax, eax
	mov bl, 00011000b
	mov al , first_last_clear
	AND al, bl
	call Writebin
	call crlf

	;'x' to 'X'
	AND x_char[0], 11011111b
	mov edx, OFFSET x_char
	call WriteString
	call crlf

	;'Z' to 'z'
	OR z_char[0], 00100000b
	mov edx, OFFSET z_char
	call WriteString
	call crlf

	;Finding 2's complement
	NOT num
	inc num
	call Writebin
	call crlf

	;Using CMP operator
	xor eax, eax
	mov al, 8
	cmp al, -8
	call DumpRegs

	mov al, 6
	cmp al, 6
	call DumpRegs

	mov al, -8
	cmp al, 8
	call DumpRegs

	;Looping 6 times using JZ
	mov eax, 0
	mov al, 5
	cmp al, 5
	mov esi, 0 
	
	jump_six_times:
		mov al, [jz_array+esi]
		call Writeint
		call crlf	
		inc esi
		cmp al, 0
	JZ jump_six_times

	;Run loop until destination is greater than source
	xor eax, eax
	mov ecx, 0
	jump_until_dest_greater:
		inc ecx				;Incrementing here bcs if done at end jumps are done upto infinity
		call Writeint		;If done at the end jumps go upto infinity
		mov al, [jg_array+ecx]
		cmp al, [jz_array+ecx]
	JG jump_until_dest_greater

	exit
	main ENDP
END main