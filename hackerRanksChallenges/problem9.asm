TITLE unknown
.386

.model flat, stdcall
Include Irvine32.inc


.data

string BYTE "esto es un isograma",0
prompt1 BYTE "Es un isograma",0
prompt2 BYTE "Esto no es un isograma",0
var1 DWORD ?
.code

	procedimiento PROC

		push ebp
		mov ebp, esp

		mov ecx, [ebp+8] ;this is length
		mov esi, [ebp+12]
		mov edi, esi
		mov ebx, 0 ;this is my i
		mov var1, ecx
			

	_fori:
		mov al, [esi+ebx]
		mov edx, ebx ;this is my j
		inc edx
		cmp ebx, [var1]
		jae _notIsogram

	_forj:
		mov bl, [edi+edx]
		cmp al, bl
		je _isIsogram
		inc edx 
		cmp edx, [var1]
		jb _forj
		jae _fori

	_pivot:
		inc ebx
		jmp _fori
	_isIsogram:
		mov edi,1
		jmp _return
	_notIsogram:
		mov edi, 0
	_return:

		pop ebp
		ret 8

	procedimiento ENDP

	main PROC

		push OFFSET string
		push LENGTHOF string - 1

		call procedimiento

		cmp edi, 0
		je _printNotIsogram

	_printIsogram:
		mov edx, OFFSET prompt1
		call WriteString
		jmp _finishProgram

	_printNotIsogram:
		mov edx, OFFSET prompt2
		call WriteString

	_finishProgram:
		invoke ExitProcess, 0

	main ENDP
	END main