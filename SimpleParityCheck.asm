.386
.model flat, stdcall
INCLUDE Irvine32.inc



.data

	prompt BYTE "Es par:",0
	prompt1 BYTE "Es impar:",0

.code


func PROC

	push ebp
	mov ebp, esp

	mov ecx, [ebp+8]
	mov ebx, 2

Bucle:
	mov eax, ecx
	cmp ecx, 0
	je retorno
	and eax, 1
	cmp eax,0
	jz primeraCondicion
	jnz segundaCondicion
	jmp retorno

primeraCondicion:
	mov edx, OFFSET prompt
	call WriteString
	mov eax, ecx
	call WriteDec
	call Crlf
	dec ecx
	jmp Bucle

segundaCondicion:
	mov edx, OFFSET prompt1
	call WriteString
	mov eax, ecx
	call WriteDec
	call Crlf
	dec ecx
	jmp Bucle

retorno:
	pop ebp
	ret 4
	
func ENDP

main PROC
	push 50
	call func
	exit
	
main ENDP
END main