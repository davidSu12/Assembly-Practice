TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, ExitCode:DWORD


.data

array DWORD 1,2,3,4,5,6,7,8,9,10


.code

	procedimiento PROC

		push ebp
		mov ebp, esp

		mov ecx, [ebp+8]
		mov esi, [ebp+12]

	_for:
		mov al, BYTE PTR [esi]
		mul al
		movzx ebx, al
		xchg [esi], ebx
		add esi, 4
		loop _for

		pop ebp
		ret 8

	procedimiento ENDP
	main PROC

		push OFFSET array
		push LENGTHOF array

		call procedimiento

		mov ecx, LENGTHOF array
		mov esi, OFFSET array

	_printArray:
		mov eax, [esi]
		call WriteInt
		call Crlf
		add esi, 4
		loop _printArray

		invoke ExitProcess, 0


	main ENDP
	END main
