INCLUDE Irvine32.inc

.data
arrayb BYTE 0, 1, 2

.code
	main PROC

	mov edi, 0
	mov edi, OFFSET arrayb
	mov eax, 0
	mov ecx, 0
	mov ecx, LENGTHOF arrayb
	L1:
		mov eax, [arrayb + edi]
		add edi, TYPE arrayb
		call Writeint
		call crlf
	LOOP L1

	exit
	main ENDP
END main