TITLE rotateDigits

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
		
		mov esi, [ebp+16]
		mov ecx, [ebp+12]
		mov edx, [ebp+8]
		shl edx, 2
		mov edi, esi
		add edi,edx


		call DumpRegs
		
	_for:
		mov eax, [edi]
		mov ebx, [esi]
		xchg eax, ebx
		mov [edi], eax
		mov [esi], ebx
		add esi, 4
		add edi, -4
		loop _for

		
		pop ebp
		ret 12


	procedimiento ENDP
	main PROC

		push OFFSET array
		push 3
		push LENGTHOF array - 1

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
