TITLE unknown
.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, dwExitCode:DWORD



.code


	procedimiento PROC

		push ebp
		mov ebp, esp

		and edx, 0h
		and ecx, 0h
		mov ecx, edi

	bucleFoor:
		
		and eax, 0h
		mov al, cl
		mul al
		call WriteInt
		call Crlf
		loop bucleFoor

	retorno:
		pop ebp
		ret

	procedimiento ENDP

	main PROC

		and edi, 0h
		mov edi, 7
		call procedimiento

		invoke ExitProcess, 0
		
	main ENDP
	END main