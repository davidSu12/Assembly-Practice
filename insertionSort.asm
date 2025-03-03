.386
.model flat, stdcall
INCLUDE Irvine32.inc
INCLUDELIB Kernel32.lib



.data
	
	array DWORD 9,2,6,2,5,6
	len DWORD LENGTHOF array


.code

;The direction of the array is in esi
;The length of the array is in edi

insertionSort PROC

	push eax
	push ebx
	push ecx
	push edx

	
		mov ecx, edi
		sub ecx,1
		mov edx, 4 ; edx = i
		
		
		firstLoop:
			mov eax, array[edx] ;eax = array[i] = x
			mov ebx, edx ;ebx
			sub ebx, 4 ;ebx = i-1 = j
										;ebx is my j
			LoopWhile:
				cmp ebx, 0
				jb endLoopWhile
				cmp array[ebx],eax
				jbe endLoopWhile


				mov edi, array[ebx]
				xchg edi, array[ebx+4]
				sub ebx, 4
				jmp LoopWhile

			endLoopWhile:

			mov array[ebx + 4], eax

			add edx, 4
			loop firstLoop

	pop edx
	pop ecx
	pop ebx
	pop eax

	ret

	

insertionSort ENDP

main PROC

	mov esi, OFFSET array
	mov edi, len

	call insertionSort

	mov esi, OFFSET array
	mov ecx, len

	printLoop:
		mov eax, [esi]
		call WriteDec
		call Crlf
		add esi, 4
		loop printLoop

	Invoke ExitProcess, 0


main ENDP
END main