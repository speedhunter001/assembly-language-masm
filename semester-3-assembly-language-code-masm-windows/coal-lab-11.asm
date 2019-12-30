INCLUDE Irvine32.inc

.data
	wval WORD 9BA6h
	num1_mul_byte BYTE 120
	num2_mul_byte BYTE 120
	
	num1_mul_word WORD 9999
	num2_mul_word WORD 6600
	result_dword DWORD ?
	
	num1_div_word WORD 9999
	num2_div_word WORD 6600
	
	
.code 
	main PROC
	
		;using shld and shrd
		mov eax, 0
		mov ax, 0AC36h
		shld wval, ax, 4  ;shld will make wval=BA6A
		mov ax, wval
		;call Writehex
		;call crlf
	
		;using 8bit x 8bit which results in 16bit
		mov eax, 0
		mov al, num1_mul_byte
		mul num2_mul_byte
		;call Writeint
		;call crlf
	
		;using 16bit x 16bit which results in 32bit
		mov eax, 0
		mov edx, 0
		mov ax, num1_mul_word   ;multiplicand in ax
		mov dx, num2_mul_word	;multiplier in dx
		mul dx
		call Dumpregs   ;If OF=1 AND CF=1 then resultant is 32bit,upper 16 is stored in dx,lower 16 stored in ax
		
		movzx ebx, dx	;Moving upper 16bits of result in ebx's lower 16bits
		;mov eax, ebx
		call Dumpregs
		
		shl eax, 16 	;Shifting lower 16bits of result to eax's upper 16bits
		call Dumpregs
		
		shld ebx, eax, 16	;Shifting ebx's lower 16bits(result's higher 16bits) to higher 16bits and shifting lower 16bits of result to lower 16bits of ebx
		call Dumpregs
		mov result_dword, ebx
		
		mov eax, result_dword
		;call Writeint
		
		;Using div
		mov eax, 0
		mov ax, 0083h	;divident
		mov bl, 2	;divisor
		div bl 
		call Dumpregs  ;AL=41h, AH=01h
		
		exit
	main ENDP
END main