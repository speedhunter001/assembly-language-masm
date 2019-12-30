INCLUDE Irvine32.inc

.data
	enter_num_msg BYTE "Write a number and you would be told wheter the number is even or odd : ",0
	num DWORD ?
	even_msg BYTE "Number is even",0
	odd_msg BYTE "Number is odd",0
	array BYTE 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	temp BYTE ?
	count BYTE 0
	
.code
	main PROC
		;call even_or_odd
		call find_prime
		exit
	main ENDP
	
	even_or_odd PROC
		mov edx, OFFSET enter_num_msg
		call WriteString
		
		call Readint
		mov num, eax
		
		test num, 1b
		JZ if_even
		jmp if_odd
		
		if_even:
			mov edx, OFFSET even_msg
			call WriteString
			jmp _exit
		if_odd:
			mov edx, OFFSET odd_msg
			call WriteString
		_exit:
		
		ret
	even_or_odd ENDP
	
	find_prime PROC
		mov eax, 0
		mov ebx, 0
		mov esi, 0
		mov ecx, 10
		
		L1:
			mov al, array[esi]
			
			PUSH ecx
			PUSH esi
			
			mov esi, 0
			mov ecx, 10
			L2:
				mov bl, array[esi]
				PUSH eax
				
				div bl
				.IF ah==0
					inc count
				.ENDIF
				
				POP eax
				LOOP L2
				
			POP esi
			POP ecx
			LOOP L1
			
			mov eax, 0
			mov al, count
			call Writedec
			call crlf
		ret
	find_prime ENDP

END main