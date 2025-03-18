.386
.model flat, stdcall
Include Irvine32.inc

.data


array DWORD 10, 9, 8, 7, 6, 5, 4, 3, 2, 1


.code


; STACK
; Dos parametros OFFSET longitud
; utilizaremos una variable local para almacenar seguir
; [ebp-4] sera nuestra variable local

shellSort PROC


	push ebp
	mov ebp, esp
	add esp, -8

	
	mov esi, [ebp+8]
	mov eax, [ebp+12]

	repetir:

	shr eax, 1
	loopFor :
	mov ebx, eax
	mov [ebp-8], ebx
	add [ebp-8], -4

	inc ebx
	mov ecx, [esi + 4 * ebx]
	mov edx, ebx
	mov [ebp-4], 1
	
	add edx, -4
	
	loopWhile:
	cmp [ebp-4], 1
	jne loopFoor
	cmp edx, 0
	jbe loopFoor
	cmp ecx, [esi - [ebp-8]]
	jae segundaCondicion

	primeraCondicion:
	mov [esi + edx * 4], [esi + [ebp-8] * 4]
	mov ebx, [ebp-8]
	jmp loopFoor

	segundaCondicion:
	mov [ebp-4], 0
	jmp loopFoor

	cmp ecx, 1
	ja repetir
	jmp retornar

	pop ebp
	mov esp, ebp
	ret 8

shelSort ENDP

main PROC

	push OFFSET array
	push LENGTHOF array - 1

	call shellSort ; hacemos la llamada

	Invoke ExitProcess, 0


main ENDP
END main