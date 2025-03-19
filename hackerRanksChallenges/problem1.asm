TITLE loops
.386
.model flat, stdcall
.stack 100h
Include Irvine32.inc


ExitProcess PROTO, dwExitCode:DWORD
.data

COMMENT ¡
Just warming up
¡

.code



	procedure PROC
		push ebp
		mov ebp, esp

		mov eax, [ebp+8]
		mov ecx, eax
		
	bucleFoor:
		
		call WriteInt
		call Crlf
		dec eax
		loop bucleFoor
		
		pop ebp
		ret 4
	procedure ENDP

	main PROC

	push 7
	call procedure

	INVOKE ExitProcess, 0

	main ENDP
	END main 