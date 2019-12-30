INCLUDE Irvine32.inc  

.data
	array BYTE 10 DUP(?)
	max BYTE ?
	min BYTE ?
	h1 BYTE ?
	h2 BYTE ?
	h3 BYTE ? 
	
.code
	main PROC

		mov eax, 0
		mov esi, 0
		_while: 
			mov eax, 0
			call readint
			mov array[esi],al
			add esi, 1
			cmp esi, 9
			JLE _while   ;if esi<=9
		
		;Finding max
		mov eax, 0
		mov esi, 0
		iterate_1:
			mov al, array[esi]
			cmp al, max
			JG if_next_is_greater
			jmp _exit_if_1
				if_next_is_greater:
					mov max, al
				_exit_if_1:
				add esi, 1
				cmp esi, 9
				JLE iterate_1
			mov al, max
			call Writeint
			
		;Finding min
		mov eax, 0
		mov esi, 0
		iterate_2:
			mov al, array[esi]
			cmp al, min
			JL if_next_is_lesser
			jmp _exit_if_2
				if_next_is_lesser:
					mov min, al
				_exit_if_2:
				add esi, 1
				cmp esi, 9
				JLE iterate_2
			mov al, min
			call Writeint
			
		;bubble sort ascending
		mov esi, 0
		mov eax, 0
		bbl_outer_iterate_a:
				mov ecx, 0
				mov ebx, 10
				sub ebx, esi
				dec ebx
				bbl_inner_iterate_a:
					mov al, array[ecx] 
					cmp al, array[ecx+1]
					JG bbl_if_a
					JMP exit_bbl_if_a
					bbl_if_a:
						xchg al, array[ecx+1]
						xchg array[ecx], al
					
					exit_bbl_if_a:
					inc ecx
					cmp ecx, ebx
					JL bbl_inner_iterate_a
			inc esi
			cmp esi, 9
			JLE bbl_outer_iterate_a

		;bubble sort descending
		mov esi, 0
		mov eax, 0
		bbl_outer_iterate_d:
				mov ecx, 0
				mov ebx, 10
				sub ebx, esi
				dec ebx
				bbl_inner_iterate_d:
					mov al, array[ecx] 
					cmp al, array[ecx+1]
					JL bbl_if_d
					JMP exit_bbl_if_d
					bbl_if_d:
						xchg al, array[ecx+1]
						xchg array[ecx], al
					
					exit_bbl_if_d:
					inc ecx
					cmp ecx, ebx
					JL bbl_inner_iterate_d
			inc esi
			cmp esi, 9
			JLE bbl_outer_iterate_d
		
		;Finding third highest
		mov esi, 0
		mov eax, 0
		mov ebx, 0
		mov al, array[esi]
		mov h1, al
		mov h2, al
		mov h3, al
		
		iterate_third_highest:
			mov al, array[esi]
			cmp al, h1
			JGE if_greater_than_h1
			
			cmp al, h2
			JGE else_if_greater_than_h2
			
			cmp al, h3
			JGE else_if_greater_than_h3
			if_greater_than_h1:
				mov bl, h2
				mov h3, bl
				mov bl, h1
				mov h2, bl
				mov h1, al
				jmp exit_ifs_max
				
			else_if_greater_than_h2:
				mov bl, h2
				mov h3, bl
				mov h2, al
				jmp exit_ifs_max
				
			else_if_greater_than_h3:
				mov h3, al
			
			exit_ifs_max:
			inc esi
			cmp esi, 9
			JLE iterate_third_highest

		mov al, h3
		call Writeint
		
		;Finding third minimum
		mov esi, 0
		mov eax, 0
		mov ebx, 0
		mov al, array[esi]
		mov h1, al
		mov h2, al
		mov h3, al
		
		iterate_third_minimum:
			mov al, array[esi]
			cmp al, h1
			JLE if_less_than_h1
			
			cmp al, h2
			JLE else_if_less_than_h2
			
			cmp al, h3
			JLE else_if_less_than_h3
			if_less_than_h1:
				mov bl, h2
				mov h3, bl
				mov bl, h1
				mov h2, bl
				mov h1, al
				jmp exit_ifs_min
				
			else_if_less_than_h2:
				mov bl, h2
				mov h3, bl
				mov h2, al
				jmp exit_ifs_min
				
			else_if_less_than_h3:
				mov h3, al
			
			exit_ifs_min:
			inc esi
			cmp esi, 9
			JLE iterate_third_minimum

		mov al, h3
		call Writeint

		
	exit
	main ENDP
END main