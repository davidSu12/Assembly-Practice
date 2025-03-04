.386
.model flat, stdcall
INCLUDE Irvine32.inc
INCLUDELIB Kernel32.lib

.data

.code

isPrime PROC

	push ecx
	push edx

	mov ecx, esi
	dec ecx

	cmp esi, 2
	jl no_es_primo

	L1:
		mov eax, esi
		cdq		; Limpia EDX para evitar errores en la división
		div ecx
		cmp edx, 0
		je no_es_primo
		loop L1

	mov edi, 1
	jmp retorno

no_es_primo:
	mov edi, 0

retorno:
	pop edx
	pop ecx

	ret

isPrime ENDP

rangePrimes PROC

	mov ecx, esi

mainBucle:
	mov esi, ecx
	call isPrime
	cmp edi, 1
	je imprimir_primo

no_imprimir_primo:
	dec ecx
	cmp ecx, 1
	jge mainBucle
	ret

imprimir_primo:
	mov eax, esi
	call WriteDec
	call Crlf
	dec ecx
	cmp ecx, 1
	jge mainBucle

	ret

rangePrimes ENDP

main PROC

	mov esi, 20
	call rangePrimes

	exit
main ENDP
END main
