section .text
	global _start

_start:
	; There are ideally two ways to divide in assembly.
	; First is to use the unsigned division instruction, which is called div.
	; Second is to use the signed division instruction, which is called idiv.


	mov rax, -10;
	mov rbx, 3;

	cqo  ; This magical instruction copies the sign bit of rax into rdx

	idiv rbx; Divide rax by rbx (result: 3 in rax, remainder in rdx)
