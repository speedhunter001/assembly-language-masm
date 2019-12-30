INCLUDE Irvine32.inc

.data
	num1_byte_to_word BYTE 00001111b
	num2_byte_to_word BYTE 255d
	source_array_1 DWORD 20 DUP(0FFFFFFFFh)
	target_array_1 DWORD 20 DUP(?)
	source_array_2 BYTE 1, 2, 3, 4, 5
	target_array_2 BYTE 5 DUP(?)
	source_var_1 BYTE 10
	target_var_1 BYTE 100
	msg1 BYTE "Source > Target",0
	msg2 BYTE "Source <= Target",0
	
.code
	main PROC

		mov al, num1_byte_to_word
		call Writebin
		call crlf
		cbw
		call Writebin
		call crlf
		
		mov eax, 0
		mov al, num2_byte_to_word
		call Dumpregs
		call crlf
		cbw
		call Dumpregs
		call crlf
		  
		cld 	;clear direction flag that means direction = forward
		mov ecx, LENGTHOF source_array_1    ;for rep
		mov esi, OFFSET source_array_1
		mov edi, OFFSET target_array_1
		REP movsd		;copy doublewords increments bcs of directiton = forward
	
		cld
		mov ecx, LENGTHOF source_array_2
		mov esi, OFFSET source_array_2
		mov edi, OFFSET target_array_2
		REP movsb
		
		
		mov esi, OFFSET source_var_1
		mov edi, OFFSET target_var_1
		cmpsb
		ja if_greater
		jmp less_or_equal
		
		if_greater:
			mov edx, OFFSET msg1
			call Writestring
			jmp _exit
		less_or_equal:
			mov edx, OFFSET msg2
			call Writestring
		_exit:
		
		exit
	main ENDP
END main