;Q1 Swapping
INCLUDE Irvine32.inc

.data
	str_1 BYTE "Super",0
	str_2 BYTE "man",0

	
.code
	main PROC
		mov edx, OFFSET str_1
		call WriteString
		call crlf
		
		mov edx, OFFSET str_2
		call WriteString
		call crlf
	
		call str_1_swap_with_str_2
		
		mov edx, OFFSET str_1
		call WriteString
		call crlf
		
		mov edx, OFFSET str_2
		call WriteString
		call crlf
		exit
	main  ENDP
	;-------------------------------------------------------------------------------------
	str_1_swap_with_str_2 PROC
	;Requires str_1 and str_2 to be declared
	;Uses eax, ecx, esi registers for use
	;Swaps str_1 with str_2
		mov eax, 0
		mov ecx, 0
		
		mov al, LENGTHOF str_1
		.IF al > LENGTHOF str_2
			mov cl, al
		.ELSE
			mov ecx, LENGTHOF str_2
		.ENDIF
		
		mov esi, 0
		L:
			mov al, str_1[esi]
			xchg str_2[esi], al
			mov str_1[esi], al
			inc esi
			LOOP L
		
		ret
	str_1_swap_with_str_2 ENDP
	;---------------------------------------------------------------------------------------------------
END main