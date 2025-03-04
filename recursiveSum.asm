.386
.model flat, stdcall
INCLUDE Irvine32.inc



.code

recSum PROC ; utilizamos registros para el paso de parametros
	
	cmp ecx, 0
	jz L1

	add eax, ecx
	dec ecx
	call recSum
	L1:
		ret
	
recSum ENDP

main PROC
	
	mov eax, 0
	mov ecx, 5
	call recSum
	call WriteDec

	Invoke ExitProcess, 0
	
main ENDP
END main