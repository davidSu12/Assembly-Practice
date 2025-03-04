.386
.model flat, stdcall

INCLUDE Irvine32.inc

;pendiente de revision


.data 
	
	array DWORD 1,2,3,4,5,6,7,8

.code
	
	BinarySearch PROC

		push ebp
		mov ebp, esp

		mov eax, [ebp+8] ; elemento a buscar
		mov ebx, [ebp+12] ; offset del array

		push LENGTHOF array - 1
		push 0
		push ebx
		push eax

		call RecursiveBinarySearch
		
		pop ebp
		ret 8

	BinarySearch ENDP

	
	RecursiveBinarySearch PROC

		;devolvemos en la edi la posicion del elemento que se busca

		push ebp
		mov ebp, esp

		mov eax, [ebp+8] ;elemento a buscar
		mov esi, [ebp+12] ;el array
		mov ebx, [ebp+16] ;i
		mov edx, [ebp+20] ;j


		cmp ebx,edx
		ja primeraCondicion
		je segundaCondicion
		jb terceraCondicion
	
		primeraCondicion: ;i > j
			mov edi, -1
			jmp retorno

		segundaCondicion: ;i = j
			cmp eax, [esi + 4*ebx]
			je elementoEncontrado
			jne primeraCondicion

			elementoEncontrado:
				mov edi, ebx
				jmp retorno

		terceraCondicion: ;i < j
			mov ecx, ebx
			add ecx, edx
			shr ecx, 1 ; medio = (i+j) div 2
			cmp eax, [esi + 4*ecx]
			jb firstRecursiveCall
			ja secondRecursiveCall
			je returnMiddle

			firstRecursiveCall:
				inc ecx
				push edx
				push ecx
				push esi
				push eax

				call RecursiveBinarySearch
				jmp retorno

			secondRecursiveCall:

				dec ecx
				push ecx
				push ebx
				push esi
				push eax

				call RecursiveBinarySearch
				jmp retorno

			returnMiddle:
				mov edi, ecx

		retorno:

			pop ebp
			ret 16

	RecursiveBinarySearch ENDP

	main PROC

		push OFFSET array
		push 5
		call BinarySearch

		mov eax, edi
		call WriteDec
		exit

	main ENDP
	END main