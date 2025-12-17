section .text
	global _start

_start:
	; Unsigned multiplication uses the mul instruction.
	; It multiplies RAX by the given operand.
	; The result is stored in RDX:RAX (upper 64 bits in RDX, lower 64 bits in RAX).

	mov rax, 5   ; Put 5 in rax
	mov rbx, 4   ; Put 4 in rbx
	mul rbx      ; Multiply rax by rbx (5 * 4 = 20)
	             ; Result: rax = 20, rdx = 0

	; Exit the program
	mov rdi, rax ; Move result (20) to rdi (exit code)
	mov rax, 60  ; sys_exit syscall number
	syscall
