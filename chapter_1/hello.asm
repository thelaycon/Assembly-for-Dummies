; Comments are generally prefixed with semicolon in Assembly. They are part of codes ignored during compilation.

section .data
	; Core bytes are initialized here.
	message db "Hello, World!", 0x0a ; 0x0a means a newline.
	length equ $ - message

section .text
	; The linker entrypoint is entered here.
	global _start


_start:
	; Assume we are calling write(1, message, length)
	mov rax, 1 ; 1 means we want to use write()
	mov rdi, 1 ; The destination gotta be the stdout (1)
	mov rsi, message ; The message source is the message bytes
	mov rdx, length ; Number of bytes
	syscall ; We invoke the kernel system call here


	; To exit, we call syscall with code 60
	mov rax, 60
	xor rdi, rdi ; Exit code. In a xor operation, 1 XOR 1 is 0. Same with a register against itself.
	syscall
