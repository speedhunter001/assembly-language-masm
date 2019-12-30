;16 bit real address mode
;If assembled in Taiz-text-editor then run on dosbox
;Takes input of a name anticipated of five letters
;Prints the name in to and fro motion 3 times 
;If you want to change the number of to and fro motion edit to_and_fro
;To and from motion is till screen's width i.e 75 (screen size = 75X25)
INCLUDE Irvine16.inc

.data
	buff BYTE 8
		BYTE 9 dup('$')   ;8 is here because the anticipated string is of 5 characters so buffer is anticipated+3,
		;9 gives 9 empty bytes when 5 characters are inputted then 
		;e.g, 08|05|68|65|6C|6C|6F|0D|XX|XX   08 is buffer length, 05 is number of characters rest is ascii 0d is end I think,in this case XX would be $
	SCREEN_WIDTH = 75
	column BYTE ?
	to_and_fro = 3
	enter_name_msg BYTE "Enter your name : ",0
	
.code
	main PROC
		mov ax, @data
		mov ds, ax
		
		mov ecx, to_and_fro    ;Number of times of to and fro motion
		call read_string_using_int
		L:
			;column is required to be 0 or < screen width
			;column gets equal to be of screen width
			call horizontal_forward_motion		
			;column is now equal to screen width
			
			;column is required to be nonzero
			;column gets equal to be 0
			call horizontal_backward_motion		
			;column is now equal to 0
			LOOP L
		exit
	main ENDP
	;--------------------------------------------------------
	read_string_using_int PROC
	;Requires buffer variable to be created
	;Takes an input of string from user using interrupt
	;Saves the string in buffer variable
		call clrscr
		
		mov ah, 0Ah
		mov edx, OFFSET buff
		int 21h	
		
		ret
	read_string_using_int ENDP
	;--------------------------------------------------------
	print_string_using_int PROC
	;Requires edx to have offset of buffer variable
	;Prints the string in buffer variable
		
		mov ah, 09h		;Function call for reading string
		mov edx, OFFSET buff
		int 21h	

		ret
	print_string_using_int ENDP
	;--------------------------------------------------------
	horizontal_forward_motion PROC
	;Requires column to be initialized with 0
	;Prints string in one row till screen end
	;Column gets modified to be equal to screen width
		.WHILE column != SCREEN_WIDTH
			call clrscr
			
			mov dl, column  ;column
			mov dh, 0		;row
			call Gotoxy		;Moving cursor to row,column position
			
			call print_string_using_int
			
			mov ax, 500		;500 micro seconds delay
			call Delay
			
			inc column
		.ENDW
		
		ret
	horizontal_forward_motion ENDP
	;--------------------------------------------------------
	horizontal_backward_motion PROC
	;Requires column to be not 0 or column of screen end
	;Prints string in one row till screen end
	;Column modifies to be 0
		.WHILE column != 0
			call clrscr
			
			mov dl, column  ;column
			mov dh, 0		;row
			call Gotoxy		;Moving cursor to row,column position
			
			call print_string_using_int
			
			mov ax, 500		;500 micro seconds delay
			call Delay
			
			dec column
		.ENDW	
		ret
	horizontal_backward_motion ENDP
	
END main