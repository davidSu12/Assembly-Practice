section .data

    mensaje db "HOla mundo", 0xA
    longitud equ $ - mensaje
section .bss
    buffer resb 64

section .text

    global _start

_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje
    mov rdx, longitud

    syscall

    mov rax, 60
    xor rdi, rdi
    syscall