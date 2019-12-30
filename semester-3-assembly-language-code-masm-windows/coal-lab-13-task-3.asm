;Q3 String concatenation after removing unnecessary characters and turning them into uppercase
INCLUDE Irvine32.inc

.data
	str_1 BYTE "aabbccdd ",0
	str_2 BYTE "eeffgghh$$$$@@@@",0
	;concatenation
	str_1_num_of_chars = LENGTHOF str_1 - 2   ;we only want letters not space 
	str_2_num_of_chars = LENGTHOF str_2 - 9	  ;we only want letters not other characters
	str_1_str_2_concatenated_num_of_chars = str_1_num_of_chars + str_2_num_of_chars 
	str_1_str_2_concatenated BYTE str_1_str_2_concatenated_num_of_chars DUP(?),0

.code 
	main PROC
		
		;INVOKE Str_ucase, ADDR str_1
		mov edx, OFFSET str_1	;parameter of to_uppercase
		mov ecx, str_1_num_of_chars		;parameter of to_uppercase
		call to_uppercase
		;INVOKE Str_ucase, ADDR str_2
		mov edx, OFFSET str_2		;parameter of to_uppercase
		mov ecx, str_2_num_of_chars		;parameter of to_uppercase
		call to_uppercase
		
		call str_1_concatenation_with_str_2
		
		mov edx, OFFSET str_1_str_2_concatenated 
		call WriteString
	
		exit
	main ENDP
	
	;-------------------------------------------------------------------------------------
	to_uppercase PROC
	;Requires edx to have offset of string variable,also requires ecx to have number of characters
	;Uses edx and ecx registers
	;Converts the string into uppercase letters
		L:
			and BYTE PTR [edx], 11011111b
			inc edx
			LOOP L
	
		ret
	to_uppercase ENDP

	str_1_concatenation_with_str_2 PROC
		
		mov eax, 0
		mov ecx, 0
		
		mov ecx, str_1_num_of_chars
		mov esi, 0
		mov edi, 0
		L1:
			mov al, str_1[esi]
			mov str_1_str_2_concatenated[edi], al
			inc esi
			inc edi
			LOOP L1
			
		mov ecx, str_2_num_of_chars
		mov esi, 0
		L2:
			mov al, str_2[esi]
			mov str_1_str_2_concatenated[edi], al
			inc esi
			inc edi
			LOOP L2
		
		ret
	str_1_concatenation_with_str_2 ENDP
	
END main