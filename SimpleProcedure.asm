.386
.model flat, stdcall

INCLUDE Irvine32.inc


.data
	
	array DWORD 1,2,3,4,5,6,7,8,9,10
	prompt BYTE "El elemento se encuentra en la posicion:",0

.code


searchEl PROC

	push ebp
	mov ebp, esp

	mov esi, [ebp+8]
	mov ecx, [ebp+12]
	mov edx, [ebp+16] 

	mov ebx, 0

Buc:
	cmp edx, [esi+ebx*4]
	je retorno
	inc ebx
	loop Buc

	mov ebx, 200

retorno:
	mov eax, ebx
	pop ebp
	ret 12
searchEl ENDP

main PROC

	push 5
	push LENGTHOF array-1
	push OFFSET array
	
	call searchEl

	mov edx, OFFSET prompt
	call WriteString
	inc eax
	call WriteDec
	

	exit
main ENDP
END main
