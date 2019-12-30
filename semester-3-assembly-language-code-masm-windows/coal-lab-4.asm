INCLUDE Irvine32.inc


.data
	var1 WORD 400
	var2 BYTE 200
	str1 BYTE "Hello Dunya ", 0dh, 0ah, 0  ;1 char = 10 byte so BYTE here means that each character is of one byte and 0 is must for terminating string 0dh is for \r(cr) and 0ah is for \n(lf)
	str2 BYTE "Ullu"

	array_word_1 WORD 10 DUP('PA')  ;10 is number of elements here and dup duplicates the given element so there each element is PAGAL,each element is of WORD size
	array_word_2 DWORD 1,2,3,4,5
	array_word_3 DWORD 1000 DUP(?) ;? for uninitialized

	;count = 5
	;count = 10
	
	speed EQU 10


.code
	main PROC

		mov eax, 0
		mov al, var2
		add ax, var1
		call Writedec
		call crlf

		xor edx, edx
		mov edx, OFFSET str1  ;OFFSET is must because its memory address where string is present and should use edx for printing string
		call WriteString
		;call crlf

		xor edx, edx
		mov edx, OFFSET str2  ;OFFSET is must because its memory address where string is present and should use edx for printing string
		call WriteString


		;mov ebx, 0
		;add ebx, count
		;call Writeint

		exit
	main ENDP
	END main
