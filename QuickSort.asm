.386
.model flat, stdcall


.data
	array DWORD 1,2,3,4,5,6,7,8,9,20
	aux DWORD LENGTHOF array DUP(?) 
.code

;derecha
;izquierda
;centro
;offset array

fusion PROC
	push ebp
	mov ebp, esp

	mov esi, [ebp-8]
	mov eax, [ebp-12] ;centro = j
	mov ebx, [ebp-16] ;izquierda = i
	mov ecx, [ebp-20] ;derecha
	mov edx, ebx      ;izquierda = K
	inc eax           ;centro += 1



	primerBucle:
		cmp ebx, eax
		ja SegundoBucle
		cmp edx, ecx
		ja SegundoBucle

		mov edi, [esi + ebx*4]
		cmp edi, [esi + eax*4]
		ja segundaCondicion

		primeraCondicion:
			mov aux[edx*4], [esi+ebx*4]
			inc ebx
			
		segundaCondicion:
			mov aux[edx*4], [esi+eax*4]
			inc eax
		jmp primerBucle

	segundoBucle:
		cmp ebx, [ebp-12]
		ja tercerBucle
		mov edi, [esi + ebx*4]
		inc ebx
		inc edx
		jmp tercerBucle

	tercerBucle:
		cmp eax, [ebp-20]
		ja cuartoBucle
		mov edi, [esi + eax*4]
		inc eax
		inc edx
		jmp tercerBucle

	cuartoBucle:
		mov edx, [ebp-16]
		cmp edx, [ebp-20]
		jae salirCuartoBucle
		mov edi, [esi+edx*4]
		mov edi, aux[esi+edx*4]
		jmp cuartoBucle

	salirCuartoBucle:
	
		pop ebp
		ret 16
		
fusion ENDP

;The direction of the array is in esi
;The length of the array is in edi


insertionSort PROC

	push eax
	push ebx
	push ecx
	push edx

	
		mov ecx, edi
		sub ecx,1
		mov edx, 4 ; edx = i
		
		
		firstLoop:
			mov eax, array[edx] ;eax = array[i] = x
			mov ebx, edx ;ebx
			sub ebx, 4 ;ebx = i-1 = j
										;ebx is my j
			LoopWhile:
				cmp ebx, 0
				jb endLoopWhile
				cmp array[ebx],eax
				jbe endLoopWhile


				mov edi, array[ebx]
				xchg edi, array[ebx+4]
				sub ebx, 4
				jmp LoopWhile

			endLoopWhile:

			mov array[ebx + 4], eax

			add edx, 4
			loop firstLoop

	pop edx
	pop ecx
	pop ebx
	pop eax

	ret


insertionSort ENDP

;derecha
;izquierda
;array

sortFusion PROC

	push ebp
	mov ebp, esp

	mov esi, [ebp+8]
	mov eax, [ebp+12] ;izquierda
	mov ebx, [ebp+16] ;derecha

	cmp eax, ebx
	jae segundaCondicion

	primeraCondicion:
		mov ecx, eax
		add ecx, ebx
		shr ecx, 1
		
		push ecx
		push eax
		push OFFSET array
		call sortFusion

		push [ebp+16]
		inc ecx
		push ecx
		push OFFSET array
		call sortFusion

		dec ecx
		push ebx
		push eax
		push ecx
		push OFFSET array
		call fusion

		jmp condicionDeRetorno

	segundaCondicion:

		;LLAMADA A INSERTION SORT

	condicionDeRetorno:
	pop ebp
	ret 12
		


	

		


sortFusion ENDP

;derecha
;izquierda
;centro
;offset array


main PROC

main ENDP
END main