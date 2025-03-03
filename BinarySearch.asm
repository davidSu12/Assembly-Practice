.386
.model flat, stdcall
INCLUDE Irvine32.inc
INCLUDELIB Kernel32.lib



.data
	
	array DWORD 1,2,3,4,5
	promptFailure BYTE "El numero no se ha podido encontrar",0
	promptSuccess BYTE "El numero buscado es:",0

.code


BinarySearch PROC

	push eax
	push ebx
	push ecx
	push edx

	mov eax,0
	mov ebx,LENGTHOF array - 1 

	BucWhile:
		cmp eax, ebx
		ja fracaso
		mov ecx, eax
		add ecx, ebx 
		shr ecx, 1 ;medio


		cmp array[ecx*4], edi
		jb primeraCondicion
		ja segundaCondicion

		mov edi,ecx
		jmp retorno
		primeraCondicion:

			inc ecx
			mov eax, ecx
			jmp BucWhile
			
		segundaCondicion:
			dec ecx
			mov ebx, ecx
			jmp BucWhile


	fracaso:
	mov edi, -1
	
	retorno:
	pop eax
	pop ebx
	pop ecx
	pop edx
	ret
BinarySearch ENDP


main PROC
	mov esi, OFFSET array
	mov edi, 3

	call BinarySearch

	mov eax, edi
	cmp eax, -1
	je finFailure

finSuccess:
	mov edx, OFFSET promptSuccess
	call WriteString

	
	call WriteDec
	jmp fin

finFailure:
	mov edx, OFFSET promptFailure
	;call WriteString


fin:
	Invoke ExitProcess, 0


main ENDP
END main