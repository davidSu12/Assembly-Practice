TITLE unknown
.386
.model flat, stdcall
Include Irvine32.inc

ExitProcess PROTO, dwExitCode:DWORD


.code


	procedimiento PROC

		push ebp
		mov ebp, esp

		mov eax, [ebp+8] ;Aqui esta el numero de elementos a imprimir
		shl eax, 2
		sub esp, eax
		lea esi, [ebp-4]
		lea ebx, [ebp-4]
		
		mov ecx, eax

		mov edx, 0

	bucleFor:

		mov esi, edx
		inc edx
		add esi, -4
		add ecx, -4
		cmp ecx, 0
		ja bucleFor
		mov ecx, eax

	imprimirNumeros:

		mov eax, ebx
		call WriteInt

		add ebx, -4
		add ecx, -4
		cmp ecx, 0
		ja imprimirNumeros


		mov esp, ebp
		pop ebp
		ret 4

		
		
	procedimiento ENDP


	main PROC

		push 5
		call procedimiento
		invoke ExitProcess, 0
	main ENDP
	END main