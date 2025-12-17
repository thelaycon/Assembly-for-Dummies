section .text
	global _start
_start:
	mov rax, 5 ; Put 5 in rax register
	mov rbx, 6 ; Put 6 in rbx register
	sub rax, rbx; Subtract rbx from rax (result: -1 in rax)

	; Now we need to exit the program
	; The exit code will be the value in rdi
	mov rdi, rax ; Move result to rdi (exit code)
	mov rax, 60 ; sys_exit syscall number
	syscall

	; Exit with code -1. Note: this doesn't print the number to stdout,
	; it just sets the exit code (check with: echo $? after running)
