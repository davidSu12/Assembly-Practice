.386
.model flat, stdcall
INCLUDE Irvine32.inc

.code

recSum PROC

	push ebp
	mov ebp,esp

	mov eax, [ebp+8]
	cmp eax, 0
	ja p_1
	mov eax, 1
	jmp r_s


p_1:
	dec eax
	push eax
	call recSum
	 
ReturnSum:
	mov ebx, [ebp+8]
	add eax, ebx

r_s:
	pop ebp
	ret 4
	

recSum ENDP




main PROC

	push 100
	call recSum
	call WriteDec
	call Crlf
	exit
	
main ENDP
END main