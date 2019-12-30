INCLUDE Irvine32.inc 

.data
	A_grade BYTE 'A', 0
	B_grade BYTE 'B', 0
	C_grade BYTE 'C', 0
	D_grade BYTE 'D', 0
	F_grade BYTE 'F', 0

.code
	main PROC

		call readint	

		cmp eax, 90
		JGE if_greater_than_ninety
		JMP exit_if_1
		if_greater_than_ninety:
			cmp eax, 100
			JLE and_less_than_hundred
			JMP exit_if_1		
			and_less_than_hundred:
				mov edx, OFFSET A_grade
				call WriteString
				call crlf
		exit_if_1:

		cmp eax, 80
		JGE if_greater_than_eighty
		JMP exit_if_2
		if_greater_than_eighty:
			cmp eax, 89
			JLE and_less_than_eighty_nine
			JMP exit_if_2		
			and_less_than_eighty_nine:
				mov edx, OFFSET B_grade
				call WriteString
				call crlf
		exit_if_2:

		cmp eax, 70
		JGE if_greater_than_seventy
		JMP exit_if_3
		if_greater_than_seventy:
			cmp eax, 79
			JLE and_less_than_seventy_nine
			JMP exit_if_3		
			and_less_than_seventy_nine:
				mov edx, OFFSET C_grade
				call WriteString
				call crlf
		exit_if_3:

		cmp eax, 60
		JGE if_greater_than_sixty
		JMP exit_if_4
		if_greater_than_sixty:
			cmp eax, 69
			JLE and_less_than_sixty_nine
			JMP exit_if_4		
			and_less_than_sixty_nine:
				mov edx, OFFSET D_grade
				call WriteString
				call crlf
		exit_if_4:

		cmp eax, 0
		JGE if_greater_than_zero
		JMP exit_if_5
		if_greater_than_zero:
			cmp eax, 59
			JLE and_less_than_fifty_nine
			JMP exit_if_5		
			and_less_than_fifty_nine:
				mov edx, OFFSET F_grade
				call WriteString
				call crlf
		exit_if_5:

	exit
	main ENDP
END main