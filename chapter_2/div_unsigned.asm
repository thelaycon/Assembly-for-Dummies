section .text
	global _start

_start:
	; There are ideally two ways to divide in assembly.
	; First is to use the unsigned division instruction, which is called div.

	; Before dividing, ensure the RDX register is zeroed out.
	xor rdx, rdx

	mov rax, 10;
	mov rbx, 3;
	div rbx; Divide rax by rbx (result: 3 in rax, remainder in rdx)

	; Now we need to exit the program
	; The exit code will be the value in rdi
	mov rdi, rax ; Move result to rdi (exit code)
	mov rax, 60 ; sys_exit syscall number
	syscall
