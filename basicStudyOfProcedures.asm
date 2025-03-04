.386
.model flat, stdcall
INCLUDE Irvine32.inc


.data


.code


addTwo PROC
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 12]
	add eax, [ebp + 8]
	pop ebp
	ret

addTwo ENDP

example PROC ; the calling procedure free's the stack
	push 6
	push 5
	call AddTwo
	add esp, 8
	ret
example ENDP

example1 PROC ; the callee procedure free'es the stack
	push ebp
	mov ebp, esp
	mov eax, [ebp+12]
	add eax, [ebp+8]
	pop ebp
	ret 8
example1 ENDP


upperCase PROC
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]
	cmp 'a', eax
	jb L1
	cmp 'z', eax
	ja L1
	sub al, 32

	
L1:	pop ebp
	ret

upperCase ENDP


saveReg PROC

	push ebp
	mov ebp, esp

	push eax
	push ebx
	push ecx
	push edx

	mov eax, [ebp+8]

	;this space is intentionally left in blanck
	pop edx
	pop ecx
	pop ebx
	pop eax
	
saveReg ENDP

mySub PROC
	
	push ebp
	push ebp, esp
	sub esp, 8
	mov DWORD PTR [ebp-4], 10
	mov DWORD PTR [ebp-8], 20
	mov esp, ebp
	pop ebp
	ret
mySub ENDP

makeArray PROC
	push ebp
	mov ebp, esp
	sub esp, 32
	lea esi, [esp-30]
	mov ecx, 30
l1: mov BYTE PTR[esi], '*'
	inc esi
	loop l1
	add esp,32
	pop ebp
	ret
makeArray ENDP


main PROC

	call DumpMem

	
main ENDP
END main