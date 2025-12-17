section .text
	global _start

_start:
	; Secondly, we use the signed division instruction, which is called idiv.
	mov rax, -10;
	mov rbx, 3;

	cqo  ; This magical instruction copies the sign bit of rax into rdx

	idiv rbx; Divide rax by rbx (result: 3 in rax, remainder in rdx)

	; Now we need to exit the program
	; The exit code will be the value in rdi
	mov rdi, rax ; Move result to rdi (exit code)
	mov rax, 60 ; sys_exit syscall number
	syscall
