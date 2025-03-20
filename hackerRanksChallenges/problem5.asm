TITLE unknown

.386
.model flat, stdcall
Include Irvine32.inc


ExitProcess PROTO, salida:DWORD

.data
	zeroString BYTE "zero", 0
	oneString BYTE "one", 0
	twoString BYTE "two", 0
	threeString BYTE "three", 0
	fourString BYTE "four", 0
	fiveString BYTE "five", 0
	sixString BYTE "six", 0
	sevenString BYTE "seven", 0
	eightString BYTE "eigth", 0
	nineString BYTE "nine", 0
	oddString BYTE "odd",0
	evenString BYTE "even",0

.code

	procedure PROC

		push ebp
		mov ebp,esp


		mov eax, 0
		mov eax, [ebp+8]
		cmp eax, 9
		
		ja _parityOption
		cmp eax, 1
		je _oneOption
		cmp eax, 2
		je _twoOption
		cmp eax, 3
		je _threeOption
		cmp eax, 4
		je _fourOption
		cmp eax, 5
		je _fiveOption
		cmp eax, 6
		je _sixOption
		cmp eax, 7
		je _sevenOption
		cmp eax, 8
		je _eightOption
		cmp eax, 9
		je _nineOption

	_zeroOption:
		mov edx, OFFSET zeroString
		call WriteString
		jmp _return
	_oneOption:
		mov edx, OFFSET oneString
		call WriteString
		jmp _return
		
	_twoOption:
		mov edx, OFFSET twoString
		call WriteString
		jmp _return
	_threeOption:
		mov edx, OFFSET threeString
		call WriteString
		jmp _return
	_fourOption:
		mov edx, OFFSET fourString
		call WriteString
		jmp _return
	_fiveOption:
		mov edx, OFFSET fiveString
		call WriteString
		jmp _return
	_sixOption:
		mov edx, OFFSET sixString
		call WriteString
		jmp _return
	_sevenOption:
		mov edx, OFFSET sevenString
		call WriteString 
		jmp _return
	_eightOption:
		mov edx, OFFSET eightString
		call WriteString
		jmp _return
	_nineOption:
		mov edx, OFFSET nineString
		call WriteString
		jmp _return

	_parityOption:
		and eax, 1h
		jnz _notEven

	_isEven:
		mov edx, OFFSET evenString
		call WriteString
		jmp _return
	_notEven:
		mov edx, OFFSET oddString
		call WriteString
	
	_return:
		pop ebp
		ret 4
	procedure ENDP

	main PROC

		mov ecx, 10
		
		bucleFor:
		push ecx
		call procedure
		call Crlf
		loop bucleFor


		Invoke ExitProcess,0

	main ENDP
	END main
