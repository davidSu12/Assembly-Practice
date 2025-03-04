.386
.model flat, stdcall
INCLUDE Irvine32.inc



.code

factorial PROC	
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]
	cmp eax, 0
	ja L1
	mov eax, 1
	jmp L2

L1: dec eax
	push eax
	call factorial
	
returnFact:
	mov ebx, [ebp+8]
	mul ebx
	
L2: pop ebp
	ret 4

factorial ENDP

main PROC

	push 5
	call factorial
	call WriteDec
	call Crlf

	Invoke ExitProcess, 0
	
main ENDP
END main