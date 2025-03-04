.386
.model flat, stdcall

INCLUDE Irvine32.inc


.code

	powerRecursive PROC
	
	push ebp

	mov ebp, esp
	mov eax, [ebp + 8] ; aqui esta 2
	mov edx, [ebp + 12] ; aqui esta n

	cmp edx, 0
	ja L1
	mov edx, 1
	jmp retorno

L1:
	dec edx
	push edx
	push eax
	call powerRecursive


returnSum:
	mov ebx, [ebp+8]
	mul ebx

	
retorno:
	pop ebp
	ret 8

	powerRecursive ENDP


	main PROC
	
	push 5
	push 2
	call powerRecursive
	call WriteDec

	main ENDP
	END main