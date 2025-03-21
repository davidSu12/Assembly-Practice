TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc


ExitProcess PROTO, salida:DWORD

.data
	string BYTE "This is a string",0
	array BYTE 5 DUP(0)
.code

	procedure PROC

		push ebp
		mov ebp,esp


		mov esi, [ebp+8]
		mov ecx, LENGTHOF string 
	
	_for:
		mov al, 65h
		cmp [esi],al
		je _eOption
		mov al, 69h
		cmp [esi], al
		je _iOption
		mov al, 6fh
		cmp [esi], al
		je _oOption
		mov al, 75h
		cmp [esi], al
		je _uOption
		
	_aOption:
		inc array
		jmp _processLoop

	_eOption:
		inc array[1]
		jmp _processLoop

	_iOption:
		inc array[2]
		jmp _processLoop
	_oOption:
		inc array[3]
		jmp _processLoop
	_uOption:
		inc array[4]

	_processLoop:
		inc esi
		loop _for
	_return:
		pop ebp
		ret 4

	procedure ENDP

	main PROC
		push OFFSET string
		call procedure

		mov esi, OFFSET array
		mov ecx, LENGTHOF array
	_for:
		mov eax, DWORD PTR [esi]
		call WriteInt
		call Crlf
		loop _for

	
		Invoke ExitProcess,0

	main ENDP
	END main
