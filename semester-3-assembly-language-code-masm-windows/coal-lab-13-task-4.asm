INCLUDE Irvine32.inc

.data
	msg1 BYTE "Enter any number : ",0
	msg2 BYTE "Total Number of digits : ",0
	msg3 BYTE "Sum of digits : ",0
	num DWORD ?
	digits BYTE 0
	sum_of_digits DWORD 0
	
.code
	main PROC
		;Taking input of number
		mov edx, OFFSET msg1
		call WriteString
		call Readint
		mov num, eax
		
		;Counting number of digits in a number
		call count_digits
		
		mov edx, OFFSET msg2
		call WriteString
		movzx eax, digits
		call Writedec
		call crlf
	
		;Summing all digits of number
		mov eax, num	;Because call to count_digits made eax=0
		call sum_digits
		
		mov edx, OFFSET msg3
		call WriteString
		mov eax, sum_of_digits
		call Writedec
	
		exit
	main ENDP
	;---------------------------------------------------------------------------------------------------
	count_digits PROC
	;Requires eax to have the number whose digits you want to count, and digits variable to be declared
	;Uses eax, ebx, edx
	;Counts the number of digits of a number
		mov ebx, 10
		.WHILE eax != 0
			mov edx,0		;As EDX:EAX is the dividend but number is only in EAX so thats why..
			div ebx			;EAX/EBX -> EAX/10, 10 removes the last digit, EAX=quotient and EDX=remainder
			inc digits		;When one digit is removed digits is incremented
		.ENDW
		
		ret
	count_digits ENDP
	;---------------------------------------------------------------------------------------------------
	sum_digits PROC
	;Requires eax to have the number whose digits you want to sum, and sum_of_digits variable to be declared
	;Uses eax, ebx, edx
	;Sums all digits of a number
		mov ebx, 10
		.WHILE eax != 0
			mov edx, 0		;As EDX:EAX is the dividend but number is only in EAX so thats why..
			div ebx			;EAX/EBX -> EAX/10, 10 removes the last digit, EAX=quotient and EDX=remainder
			add sum_of_digits, edx		;EAX=quotient and EDX=remainder, as remainder is the removed digit which is then added
		.ENDW
		
		ret
	sum_digits ENDP
	;---------------------------------------------------------------------------------------------------
END main