TITLE UNKNOWN

.386
.model flat, stdcall
Include Irvine32.inc



.data

array DWORD 10,9,8,7,6,5,4,3,2,1
temp DWORD 0

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

	mov eax, LENGTHOF array;ncremento

	_repetir:
	shr eax,  1

	mov ecx, eax
	shl ecx, 2
	add ecx, 4 ;i

	_forLoop:
	mov ebx, array[ecx] ;tmp
	mov edx, ecx		;j
	mov edi, 1

	_mientras:
	mov esi, edx
	mov temp, eax
	shl temp, 2
	sub esi, temp
	mov temp, 0
	cmp esi, 0
	jbe _finMientras
	cmp edi, 1
	jne _finMientras

	_condition:
	cmp ebx, array[esi]
	jae _noCondition
	
	mov temp, eax
	mov eax, array[edx]
	xchg eax, array[esi]
	mov eax, temp

	mov edx, esi
	jmp _mientras

	_noCondition:
	mov edi, 0
	jmp _mientras

	_finMientras:
	mov array[edx], ebx

	add ecx, 4
	cmp ecx, SIZEOF array
	jb _forLoop

	cmp eax, 1
	jne _repetir

	push LENGTHOF array
	push OFFSET array

	call imprimirArray



	invoke ExitProcess, 0

main ENDP
END main