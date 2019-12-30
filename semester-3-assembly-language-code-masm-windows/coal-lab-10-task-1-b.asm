INCLUDE Irvine32.inc

.data
array1 SDWORD 10 DUP(?)
int_to_search_msg1 BYTE "Enter the integer which you want to find in array : ",0
int_to_search_msg2 BYTE "The integer : ",0
int_to_search_msg3 BYTE " is found at index(0-9) : ",0
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
		
		;Finding the user required integer in array
		mov edx, OFFSET int_to_search_msg1
		call WriteString
		call Readint  ;eax has the integer which we want to search
		mov ecx, 10
		mov esi, OFFSET array1
		b_L1:
			mov ebx, [esi]
			
			.IF eax == ebx
				mov edx, OFFSET int_to_search_msg2
				call WriteString
				call Writeint
				
				mov edx, OFFSET int_to_search_msg3
				call WriteString
				
				mov eax, 10
				sub eax, ecx
				call Writedec
				
				jmp break_b_L1
			.ENDIF
			
			add esi, 4
			LOOP b_L1
			break_b_L1:
	
	exit
	main ENDP
END main