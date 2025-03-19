TITLE unknown
.386
.model flat, stdcall
Include Irvine32.inc


ExitProcess PROTO, dwExitCode: DWORD

COMMENT !

	Given an integer, , perform the following conditional actions :
	If  is odd, print Weird
	If  is even and in the inclusive range of 2 to,5 print Not Weird
	If  is even and in the inclusive range of 6 to, 20print Weird
	If  is even and greater than, print Not Weird
!

.data

num DWORD 5
string1 BYTE "Not Weird",0
string2 BYTE "Weird",0
stringAux BYTE "Condition not found",0

.code

;vamos a utilizar simplemente paso por registro y evitamos uso de la pila
;Nuestro numero se encuentra en edi

procedimiento PROC

	push ebp
	mov ebp, esp

	mov eax, edi
	and eax, 1h
	jnz notEven

isEven:

	cmp edi, 2
	jb segundaCondicion
	cmp edi, 5
	ja segundaCondicion

primeraCondicion:
	mov edx, OFFSET string1
	call WriteString
	jmp retorno

segundaCondicion:
	cmp edi, 6
	jb terceraCondicion
	cmp edi, 20
	ja terceraCondicion
	
	mov edx, OFFSET string2
	call WriteString
	jmp retorno

terceraCondicion:
	cmp edi, 20
	ja cuartaCondicion

condicionNoEncontrada:
	mov	edx, OFFSET stringAux
	call WriteString
	jmp retorno

cuartaCondicion:
	mov edx, OFFSET string2
	call WriteString
	jmp retorno


notEven:
	mov edx, OFFSET string2
	call WriteString

retorno:
	pop ebp
	ret
	
procedimiento ENDP


main PROC

	mov edi, 0
	mov edi,  num
	call procedimiento



	invoke ExitProcess, 0
	
main ENDP
END main
