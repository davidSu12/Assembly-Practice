TITLE unknown
.386
.model flat, stdcall
include Irvine32.inc

ExitProcess PROTO, exitCode:DWORD


.data

captionW BYTE "Warning",0
warningMsg BYTE "The current operation may take years",0


captionWprime BYTE "Esto es un mensaje",0
captionMsg BYTE "Esto es otro mensaje",0

.code

main PROC
	
	INVOKE MessageBox, NULL, ADDR warningMsg,
	ADDR captionW, MB_OK + MB_ICONEXCLAMATION


	INVOKE MessageBox, NULL, ADDR captionMsg,
	ADDR captionWprime, MB_YESNO
	
	INVOKE ExitProcess, 0

main ENDP
END main