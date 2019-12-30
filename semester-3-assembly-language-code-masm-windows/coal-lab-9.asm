INCLUDE Irvine32.inc

.data
	a BYTE 16
	b BYTE 32
	ce BYTE 64  ;ce bcs c is keyword
	d BYTE 64
	e BYTE ?
	equat BYTE ?    ;equat bcs eq is keyword
	ls BYTE ?
	gr BYTE ?
	count BYTE ?
	e_is_str BYTE "e is ",0
	times_less_str BYTE " times less than d",0

.code
	main PROC

	mov eax, 0
	mov al, a
	add al, b
	mov e, al	;a + b
	
	cmp al, d
	
	JE if_e_is_d
	JMP else_e_is_d
		if_e_is_d:
			mov equat, 1
			jmp exit_if_1
		else_e_is_d:
			mov equat, 0
	exit_if_1:

	cmp al, d
	JG if_e_greater_than_d
	JMP else_e_greater_than_d	
		if_e_greater_than_d:
			mov gr, 1
			jmp exit_if_2
		else_e_greater_than_d:
			mov gr, 0
	exit_if_2:

	cmp al, d
	JL if_e_less_than_d
	JMP else_e_less_than_d	
		if_e_less_than_d:
			mov ls, 1
			JMP exit_if_3
		else_e_less_than_d:
			mov ls, 0
			
			JMP _while_condition
				_while:
					INC count
				_while_condition:
					cmp al, d
					JNE _while

			mov edx, OFFSET e_is_str
			call WriteString
			mov eax, 0
			mov al, count
			call Writeint
			mov edx, OFFSET times_less_str
			call WriteString
			call crlf				
	exit_if_3:



	exit	
	main ENDP
END main