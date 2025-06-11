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


	mov ecx, 0

_fori:

	;ecx is my i
	mov eax, ecx;   minj
	mov ebx, array[ecx] ;minx


	mov edx, ecx ;j
	add edx, 4
_forj:
	
	cmp array[edx], ebx
	jae _postcond
	mov eax, edx
	mov ebx, array[edx]

_postcond:


	add edx, 4
	cmp edx, SIZEOF array
	jb _forj

_finforj:
	mov esi, array[ecx]
	mov array[eax], esi
	mov array[ecx], ebx


	
	add ecx, 4
	cmp ecx, SIZEOF  array - 4
	jb _fori


	push LENGTHOF array
	push OFFSET array

	call imprimirArray

	invoke ExitProcess, 0

main ENDP
END main