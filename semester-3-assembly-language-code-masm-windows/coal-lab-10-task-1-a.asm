INCLUDE Irvine32.inc

.data
	array1 SDWORD 10 DUP(?)
	msg1 BYTE "To sort the array in ASCENDING order press 1, to sort the array in DESCENDING order press 2 : ",0
	msg2 BYTE "You have not pressed 1 or 2",0
	print_msg BYTE "--Printing array--",0

.code
	main PROC
	
		;Taking input of random 10 integers in an array
		mov ecx, 10
		mov esi, 0
		a_L1:
			call Readint
			mov array1[esi], eax
			
			add esi, 4
			LOOP a_L1
		
		call print_array
	  
		;Asking the user the order in which to sort
		mov edx, OFFSET msg1
		call WriteString
		call Readint
		
		.IF eax == 1
			call bubble_sort_ascending
			call print_array
			
		
		.ELSEIF eax == 2
			call bubble_sort_descending
			call print_array
		
		.ELSE
			mov edx, OFFSET msg2
			call WriteString
		
		.ENDIF
	exit
	main ENDP
	
	print_array PROC
		mov edx, OFFSET print_msg
		call WriteString		
		call crlf
		mov ecx, 10
		mov esi, 0
		a_L2:
			mov eax, array1[esi]
			call Writeint
			call crlf
			add esi, 4
			LOOP a_L2
		ret
	print_array ENDP
	
	bubble_sort_ascending PROC
		;requires array to be inputted
		;sorts array in ascending
		mov ecx, 0
		.WHILE ecx < 10
			
			mov ebx, 10
			sub ebx, ecx
			dec ebx
			mov esi, 0
			.WHILE esi < ebx
				mov eax, array1[esi*4]
				
				.IF eax > array1[(esi*4)+4]
					xchg eax, array1[(esi*4)+4]
					xchg array1[esi*4], eax
				.ENDIF
				
				inc esi
			.ENDW
			
			inc ecx
		.ENDW
		ret
	bubble_sort_ascending ENDP
	
	bubble_sort_descending PROC
		;requires array to be inputted
		;sorts array in descending
		mov ecx, 0
		.WHILE ecx < 10
			
			mov ebx, 10
			sub ebx, ecx
			dec ebx
			mov esi, 0
			.WHILE esi < ebx
				mov eax, array1[esi*4]
				
				.IF eax < array1[(esi*4)+4]
					xchg eax, array1[(esi*4)+4]
					xchg array1[esi*4], eax
				.ENDIF
				
				inc esi
			.ENDW
			
			inc ecx
		.ENDW
		ret
	bubble_sort_descending ENDP
END main