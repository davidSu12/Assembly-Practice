TITLE unknown
.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, exitCode:DWORD


.data
array1 DWORD 1,2,3,4,5,6,7,8,9,10
array2 DWORD 1,2,3,4,5,6,7,8,9,10
prompt1 BYTE "Hay mas de 4 elementos desiguales",0
prompt2 BYTE "Hay menos de 4 elementos desiguales",0
.code

procedimiento PROC 

	push ebp
	mov ebp, esp

	mov esi, [ebp+8]
	mov edi, [ebp+12]
	mov ecx, [ebp+16]
	mov eax, 0

	;el rendimiento se mejora con direccionamiento directo
_for:
	
	mov ebx, [esi]
	not ebx
	and ebx, [edi]
	jz _incrementarContador
_volver:
	add esi, 4
	add edi, 4
	loop _for
	jmp _notEqual

_incrementarContador:
	inc eax
	cmp eax, 4
	je _areEqual
	jmp _volver

_notEqual:
	mov edi, 0
	jmp _retornar

_areEqual:
	mov edi, 1

_retornar:

	pop ebp
	ret 12



procedimiento ENDP

main PROC

	push LENGTHOF array1
	push OFFSET array1
	push OFFSET array2
	call procedimiento

	cmp edi, 1
	je _printEqual

_notEqual:
	mov edx, OFFSET prompt2
	call WriteString
	jmp _finishProgram

_printEqual:
	mov edx, OFFSET prompt1
	call WriteString

_finishProgram:
	invoke ExitProcess, 0


main ENDP
END main