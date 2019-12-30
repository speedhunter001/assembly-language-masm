INCLUDE Irvine32.inc

.data
	;TASK 1
	count = 10
	a SBYTE -128
	b SBYTE -127
	ce SBYTE -1
	myInt BYTE count
	
	;TASK 2
	addResult SBYTE ?
	add_msg BYTE "The addition result is : ",0
	
	mulResult SBYTE ?
	mul_msg BYTE "The multiplication result is : ",0

	count_msg BYTE "COUNT is : ",0

	;TASK 3
	temp SBYTE ?  
	a_msg BYTE "a : ",0
	b_msg BYTE "b : ",0

	;TASK 4 
	myArr BYTE 20 DUP(0)

.code
	main PROC
		;TASK 2
		xor eax, eax
		xor edx, edx
		mov al, b
		add al, ce

		mov addResult, al
		mov edx, OFFSET add_msg
		call WriteString
		call Writeint
		call crlf

		xor eax, eax
		xor edx, edx
		mov al, a
		imul ce
		mov mulResult, al
		mov edx, OFFSET mul_msg
		call WriteString
		call Writeint
		call crlf

		xor eax, eax
		xor edx, edx
		mov al, count
		mov edx, OFFSET count_msg
		call WriteString
		call Writedec
		call crlf

		;TASK 3
		xor eax, eax
		mov al, a     ;temp = a
		mov temp, al
		
		mov al, b
		xor edx, edx
		mov a, al     ;a = b
		mov edx, OFFSET a_msg
		call WriteString
		call Writedec
		call crlf

		xor eax, eax
		xor edx, edx
		mov al, temp
		mov b, al     ;b = temp
		mov edx, OFFSET b_msg
		call WriteString
		call Writedec
		call crlf

		mov al, 0
		mov temp, al   ;temp = 0

		exit
	main ENDP
	END main