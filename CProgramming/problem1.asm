TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, ExitCode:DWORD

.code

main PROC

	mov ecx, 10
	mov edx, 0


_for:
	mov ax, cx
	mul ax
	mov bx, ax
	and ax, 1h
	cmp ax, 0
	jne _odd

_even:
	movzx eax, bx
	call WriteInt
	call Crlf
	loop _for
	jmp _returnProgram

_odd:
	loop _for

_returnProgram:
	invoke ExitProcess, 0

main ENDP
END main