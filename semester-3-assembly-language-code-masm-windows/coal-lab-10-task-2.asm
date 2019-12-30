INCLUDE Irvine32.inc

.data
	array1 SDWORD 11 DUP(?)
	msg1 BYTE "To sort the array in ASCENDING order press 1, to sort the array in DESCENDING order press 2 : ",0
	msg2 BYTE "You have not pressed 1 or 2",0
	print_msg BYTE "--Printing array--",0
	number_to_find_msg BYTE "Enter the number which you want to find using BINARY SEARCH ALGORITHM : ",0
	number_to_find SDWORD ?
	number_found_msg1 BYTE "Number is found at : ",0
	number_found_msg2 BYTE "Number is not found",0
	ending DWORD ?
    starting DWORD ?
	
	o BYTE "starting is : ",0
	p BYTE "ending is : ",0
	hh BYTE "recursive call",0
.code
	main PROC
	
		;Taking input of random 10 integers in an array
		mov ecx, 11
		mov esi, 0
		a_L1:
			call Readint
			mov array1[esi], eax
			
			add esi, 4
			LOOP a_L1
		
		call print_array
	  
		;sorting the array in ascending order
		call bubble_sort_ascending
		call print_array
			
		;calling binary search
		mov edx, OFFSET number_to_find_msg
		call WriteString
		call Readint
		mov number_to_find, eax
			
		mov ecx, 0
		mov esi, (LENGTHOF array1) -1
		call binary_search_ascending_array
	exit
	main ENDP
	
	print_array PROC
		mov edx, OFFSET print_msg
		call WriteString		
		call crlf
		mov ecx, 11
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
		.WHILE ecx < 11
			
			mov ebx, 11
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
		.WHILE ecx < 11
			
			mov ebx, 11
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
	
	binary_search_ascending_array PROC
		;requires ecx to be 0 and esi to be last index
		;prints whether number is found or not
		.IF esi >= ecx
			;calculating mid index in ebx
			mov starting, ecx
			mov ending, esi
			mov ebx, ending
			add ebx, (ending-starting)/2  ;mid = starting + (ending - starting)/2
			
			mov eax, array1[ebx]
			.IF eax == number_to_find
				mov edx, OFFSET number_found_msg1
				call WriteString
			
			.ELSEIF eax > number_to_find
				mov ecx, starting  ;starting = starting
				mov esi, [ebx]-1   ;ending = mid - 1
				call binary_search_ascending_array
				
			.ELSE
				mov ecx, [ebx]+1  ;starting = mid + 1
				mov esi, ending   ;ending = ending
				call binary_search_ascending_array
			.ENDIF
		
		.ELSE
			mov edx, OFFSET number_found_msg2
			call WriteString
		.ENDIF
		ret
	binary_search_ascending_array ENDP
END main