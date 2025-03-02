INCLUDE Irvine32.inc

.data

	string BYTE "Esto es un mensaje al reves",0
	var2 BYTE LENGTHOF string - 1

.code
main PROC
	
	mov ecx, DWORD PTR var2
	mov esi, OFFSET string

	L1:
		movzx eax, BYTE PTR [esi+0]
		push eax
		add esi, 1
		loop L1
	
	mov esi, 0
	mov ecx, DWORD PTR var2

	L2:
		pop eax
		mov string[esi], al
		add esi, 1
		loop L2


	mov edx, OFFSET string
	call WriteString
	exit



main ENDP
END main
