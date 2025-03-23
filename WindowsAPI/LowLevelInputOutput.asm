TITLE unknown
.386
.model flat, stdcall
include Irvine32.inc

 
.data


prompt1 BYTE "The number is above",0
messageSize1 DWORD ($-prompt1)

prompt2 BYTE "The number is below",0
messageSize2 DWORD ($-prompt2)

prompt3 BYTE "Enter a digit between 1 and 100:",0
messageSize3 DWORD ($-prompt3)

prompt4 BYTE "¡Welcome to this new game!",0
messageSize4 DWORD ($-prompt4)

prompt5 BYTE "The number of trials was:",0
messageSize5 DWORD ($-prompt5)

prompt6 BYTE "A number Between 1 and 100 has been generated."
		BYTE "Your goal is to guess it.",0
messageSize6 DWORD ($-prompt6)

prompt7 BYTE "¡Congratulations! You correctly guessed the number:",0
messageSize7 DWORD ($-prompt7)


randVal DWORD ?

stdInHandle HANDLE ? 
stdOutHandle HANDLE ? 

bytesRead DWORD ?
bytesWritten DWORD ? 

numberOfTrial DWORD 0


.code

	main PROC

	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov stdInHandle, eax
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov stdOutHandle, eax


	mov eax, 100
	call RandomRange
	mov randVal, eax

	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt4,
	messageSize4,
	ADDR bytesWritten,
	0
	
	call Crlf
	
	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt6,
	messageSize6,
	ADDR bytesWritten,
	0

	call Crlf

_mainLoop:

	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt3,
	messageSize3,
	ADDR bytesWritten,
	0

	call ReadDec
	cmp eax, randVal
	je _isEqual
	inc numberOfTrial
	cmp eax, randVal
	ja _isAbove

_isBelow:
	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt2,
	messageSize2,
	ADDR bytesWritten,
	0
	call Crlf
	
	jmp _mainLoop

_isAbove:
	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt1,
	messageSize1,
	ADDR bytesWritten,
	0
	call Crlf
	jmp _mainLoop

_isEqual:
	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt7,
	messageSize7,
	ADDR bytesWritten,
	0
	mov eax, randVal
	call WriteInt
	call Crlf

	INVOKE WriteConsole,
	stdOutHandle,
	ADDR prompt5,
	messageSize5,
	ADDR bytesWritten,
	0
	mov eax, numberOfTrial
	call WriteInt

	INVOKE ExitProcess,0
	
	main ENDP
	END main