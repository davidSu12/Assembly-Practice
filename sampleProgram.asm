INCLUDE Irvine32.inc


.data

	messageInput BYTE "Enter a 32 bit integer in decimal format:",0
	count EQU 10
	messageBin BYTE "BinFormat:",0
	messageHex BYTE "HexFormat:",0

.code
main PROC

	mov ecx, count
	

	L1:
		mov edx, OFFSET messageInput
		call WriteString

		call ReadDec
		
		mov edx, OFFSET messageBin
		call WriteString

		call WriteBin
		call Crlf

		mov edx, OFFSET messageHex
		call WriteString

		call WriteHex
		call Crlf
		loop L1

	exit


main ENDP
END main
