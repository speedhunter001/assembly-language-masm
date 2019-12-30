INCLUDE Irvine32.inc

.data
	str_1 BYTE "hello",0
	str_2 BYTE "hell",0
	str_3 BYTE 5 DUP(?),0
	str_4 BYTE "I ####",0
	str_5 BYTE "##I ####",0
	str_6 BYTE "abcdef",0
	
.code
	main PROC

		INVOKE Str_compare, ADDR str_1, ADDR str_1
		call Dumpregs   ;str_1==str_2  CF=0 ZF=1
	
		INVOKE Str_compare, ADDR str_1, ADDR str_2
		call Dumpregs   ;str_1>str_2  CF=0 ZF=0
		
		INVOKE str_compare, ADDR str_2, ADDR str_1
		call Dumpregs	;str_2<str_1  CF=1 ZF=0
	
	
		call clrscr
		
		INVOKE Str_length, ADDR str_1
		call Dumpregs	;eax has length and in this case length is 5
		
		
		call clrscr
		
		INVOKE Str_copy, ADDR str_1, ADDR str_3		;copies str_1 to str_3
		mov edx, OFFSET str_3
		call WriteString
		call crlf
		
		
		call clrscr
		
		
		mov edx, OFFSET str_4
		call WriteString
		call crlf
		
		INVOKE Str_trim, ADDR str_4, '#'	;Trims from the end of the string and when it sees a character-not-to-trim it will stop there
		
		mov edx, OFFSET str_4
		call WriteString
		call crlf

		
		call clrscr
		
		mov edx, OFFSET str_5
		call WriteString
		call crlf
		
		INVOKE Str_trim, ADDR str_5, '#'	;Trims from the end of the string and when it sees a character-not-to-trim it will stop there
		
		mov edx, OFFSET str_5
		call WriteString
		call crlf		
		
		
		call clrscr
		
		mov edx, OFFSET str_6
		call WriteString
		call crlf
		
		INVOKE Str_ucase, ADDR str_6	;converts all letters to uppercase letters string 
		
		mov edx, OFFSET str_6
		call WriteString
		call crlf
		
	exit
	main ENDP
END main