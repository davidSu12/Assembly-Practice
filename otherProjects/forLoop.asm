TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, ExitCode:DWORD

.code

main PROC


mov ecx, 10
_fori:
cmp ecx, 0
jbe _return	
mov al, '*'
mov ebx, 0
call Crlf
dec ecx
_forj:
	call WriteChar
	cmp ebx, ecx
	inc ebx
	jbe _forj
	jmp _fori
_return:
invoke ExitProcess, 0
main ENDP
END main