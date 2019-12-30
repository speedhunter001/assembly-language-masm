INCLUDE Irvine16.inc

.data
	random_file BYTE "mal-", 4 DUP(?), ".exe",0  
	
.code
	main PROC
		mov ax, @data
		mov ds, ax
		
		call generate_random_exe_files
		
		exit
	main ENDP
	;----------------------------------------------------------------------------------------------------
	generate_random_exe_files PROC
	;Requires random_file to be created
	;Uses ecx,si,eax,al,dx,bx registers and create_file and close_file functions
	;Generates mal-...exe files infinitely or upto n times
	
		call randomize		;Re-seeds random number generator with current time in hundredths of seconds
		
		;mov ecx, 0
		create_random_exe_file:
			mov si, 4			;Because we need to insert after - in 'mal-' which is 4 index 
			randomize_and_move:
				mov eax, 10
				call RandomRange
				
				or al, 00110000b		;Because moving a number in a string will make it be read as ascii so converting to ascii here
				mov random_file[si], al
				
				inc si
				cmp si, (LENGTHOF random_file) - 5		;-5 is being done here because last five characters are '.exe,0'
				JB randomize_and_move
		
			;mov file[si], '.'
			;mov file[si+1], 'e'
			;mov file[si+2], 'x'
			;mov file[si+3], 'e'
		
			;mov dx, OFFSET random_file
			;call Writestring
			
			mov dx, OFFSET random_file
			call create_file		;Requires dx to have file name
			
			mov bx, ax
			call close_file		;Requires bx to have file handle
			
			;inc ecx
			;cmp ecx, 10
			;JBE create_random_exe_file
			JMP create_random_exe_file
	
		ret
	generate_random_exe_files ENDP
	;--------------------------------------------------------------------------------------------------
	create_file PROC
	;Requires dx to have file name
	;Uses ah, cx registers
	;Creates a file
		mov ah, 3Ch		;Interrupt for creating a file
		mov cx, 00h		;Attribute
		int 21h			;If successful then file handle in ax,otherwise Carry Flag is set
						;No need for JC condition here 
		ret
	create_file ENDP
	;--------------------------------------------------------------------------------------------------
	close_file PROC
	;Requires bx to have file handle
	;Uses ah register
	;Closes the file
		mov ah, 3Eh		;Interrupt for closing a file
		int 21h			;No need for JC condition here

		ret
	close_file ENDP
END main