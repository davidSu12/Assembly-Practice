.386
.model flat, stdcall
INCLUDE Irvine32.inc
INCLUDELIB Kernel32.lib


.data
	
	array DWORD 3 DUP(?)
	prompt BYTE "Enter a number please:",0
	prompt_result BYTE "The result of the sum is:",0
	array_length BYTE LENGTHOF array

.code

ArraySum PROC

	push eax
	push ebx

	mov eax, 0
	mov ecx, esi
	L1:
		add eax, [edi]
		add edi, 4
		loop L1
	
	mov edx, eax

	pop eax
	pop ebx

	ret

ArraySum ENDP

main PROC

	mov ecx, 3
	mov esi, OFFSET array

	L1:
		mov edx, OFFSET prompt
		call WriteString

		call ReadDec
		mov [esi], eax
		add esi, 4
		loop L1

	mov esi, DWORD PTR array_length
	mov edi, OFFSET array
	call ArraySum

	mov eax, edx

	mov edx, OFFSET prompt_result
	call WriteString

	call WriteDec

	Invoke ExitProcess,0

	

main ENDP
END main
