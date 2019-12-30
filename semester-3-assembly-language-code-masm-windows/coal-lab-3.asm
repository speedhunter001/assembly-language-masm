INCLUDE Irvine32.inc

.data
	num1 BYTE 200
	num2 BYTE 459
.code
	main PROC
		xor al, al
		xor bl, bl

		mov al, num1
		add bl, num2

		add bl, al
		call Writedec

		exit
	main ENDP
	END main