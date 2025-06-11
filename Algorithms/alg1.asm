TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, ExitCode:DWORD


.data


array DWORD 10,9,8,7,6,5,4,3,2,1


.code



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

	mov ecx, LENGTHOF array
	mov eax, 4 

_outerLoop:

	             
	mov ebx, array[eax]		;Aqui esta mi x 
	mov edx, eax
	add edx, -4			;Aqui esta mi j

_mientras:

	cmp edx, 0
	jb _finMientras
	cmp array[edx], ebx
	jbe _finMientras


	mov edi, edx
	mov edx, array[edi]
	xchg edx, array[edi + 4]
	mov edx, edi
	add edx, -4  ;j-1
	jmp _mientras

_finMientras:

	mov array[edx + 4], ebx
	add eax, 4
	loop _outerLoop


	push LENGTHOF array + 1
	push OFFSET array

	call imprimirArray

	invoke ExitProcess, 0

main ENDP
END main