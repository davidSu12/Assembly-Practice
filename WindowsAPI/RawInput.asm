TITLE unknown
.386
.model flat, stdcall
include Irvine32.inc

BufSize = 80

.data

buffer BYTE BufSize DUP(?), 0, 0
stdInHandle HANDLE ?
bytesRead DWORD ?

.code

main PROC
	
	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov stdInHandle, eax

	INVOKE ReadConsole, stdInHandle, ADDR buffer,
	BufSize, ADDR bytesRead, 0

	
	mov edx, OFFSET buffer
	call WriteString
	INVOKE ExitProcess, 0

main ENDP
END main