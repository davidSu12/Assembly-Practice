.386
.model flat, stdcall

INCLUDE Irvine32.inc


.data
	
	array DWORD 1,2,3,4,5,6,7,8,9,10
	prompt BYTE "El numero de ocurrencias es:",0

.code


countOc PROC
	push ebp

	mov ebp, esp

	mov esi, [ebp+8]
	mov ebx, [ebp+12]
	mov ecx, [ebp+18]

	mov eax, 0
	mov edi, 0

_buc:
	cmp ebx, [esi+edi*4]
	je _incr

	loop _buc
	jmp _ret

_incr:
	inc eax
	jmp _buc
	
_ret:
		
	pop ebp
	ret 12
countOc ENDP

main PROC

	push 5
	push LENGTHOF array-1
	push OFFSET array
	
	call countOc

	mov edx, OFFSET prompt
	call WriteString
	inc eax
	call WriteDec
	

	exit
main ENDP
END main
