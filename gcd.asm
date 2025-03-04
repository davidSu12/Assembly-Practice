.386
.model flat, stdcall
INCLUDE Irvine32.inc
INCLUDELIB Kernel32.lib

.data

	

.code

;x in edi
;y in esi
; 

euclides PROC

	push eax
	push ebx
	push ecx
	push edx

	mov eax, edi
	mov ebx, esi

	bucle:
		cdq
		idiv ebx
		mov eax, ebx
		mov ebx, edx
		cmp ebx, 0
		ja bucle


	mov edi, eax; valor de retorno

	pop edx
	pop ecx
	pop ebx
	pop eax
	

	ret


euclides ENDP
main PROC

	mov edi, 1024
	mov esi, 512
	call euclides

	mov eax, edi
	call WriteDec

	exit
main ENDP
END main