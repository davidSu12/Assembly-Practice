TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, ExitCode:DWORD


.data


array DWORD 3,4,7,10,11,15,17,19,20,21


.code



busquedaProc PROC


	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]		;direccion array
	mov edi, [ebp + 12]		;longitud array
	mov ecx, [ebp +16]			;Elemento a buscar

	mov edx, 0

_mientras:
	
	cmp edx, edi
	ja _finMientras
	mov ebx, edx
	add ebx, edi 
	shr ebx, 1

	cmp [esi + ebx*4], ecx
	ja _greater			;si es mas grande saltamos a la etiqueta _great
	je _equal			;si es igual saltamos directamente
	jl _less

	jmp _finMientras
_less:
	mov edx, ebx
	inc edx
	jmp _mientras

_greater:
	mov edi, ebx
	dec edi
	jmp _mientras

_equal:
	mov eax, ebx
	jmp _retornar


_finMientras:
	mov eax, -1
_retornar:
	pop ebp
	ret 12

busquedaProc ENDP


imprimirArray PROC

	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]
	mov ecx, [ebp + 12]

_loop:

	mov eax, [esi]
	call WriteDec
	call Crlf
	add esi, 4
	loop _loop

	pop ebp
	ret 8

imprimirArray ENDP


main PROC


	push 11
	push LENGTHOF array - 1
	push OFFSET array


	call busquedaProc
	call DumpRegs


	invoke ExitProcess, 0

main ENDP
END main