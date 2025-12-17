section .text
	global _start

_start:
	; Signed multiplication uses the imul instruction.

	mov rax, -5 ; Put -5 in rax register
	mov rbx, 4  ; Put 4 in rbx register

	; Single operand imul multiplies RAX by the operand.
	; The result spans RDX:RAX (128-bit).
	imul rbx    ; rax = rax * rbx (-5 * 4 = -20)

	; Now we need to exit the program
	; The exit code will be the value in rdi

	mov rdi, rax ; Move result to rdi (exit code)
	mov rax, 60 ; sys_exit syscall number
	syscall

	; Exit with code -20.
	; echo $? will display 236 (256 - 20)
