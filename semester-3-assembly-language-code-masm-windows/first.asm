INCLUDE Irvine32.inc

.data
	Msg1 BYTE "I love superman",0

.code
	main PROC
	
		mov edx,OFFSET Msg1
		call WriteString
		exit
	main ENDP
	END main
	