# Chapter 1: Understanding Registers

In this chapter, we need to understand and think in registers. When working with assembly, we store, retrieve, and manipulate data using registers. In x86-64, registers are 64-bit storage spaces that hold values for use in the program. The architecture provides a set of predefined registers, with popular ones including RAX, RDI, RSI, RBX, RCX, and RDX. In this chapter, we focus on the following key registers:

- **RAX (Accumulator Register)**: Used to store return values and system call numbers. When making a system call, RAX tells the kernel which system call to execute.

- **RDI (Destination Index Register)**: Used to pass the first argument of a system call or function. For instance, in `write()`, this specifies the file descriptor.

- **RSI (Source Index Register)**: Used to pass the second argument of a system call or function. In `write()`, this points to the buffer containing the data to write.

- **RDX (Data Register)**: Used to pass the third argument of a system call or function. In `write()`, this specifies the number of bytes to write.

The code for a simple Hello World program is given below:

```asm
; Comments are generally prefixed with semicolon in Assembly.
; They are parts of the code ignored during compilation.

section .data
    ; Core bytes are initialized here.
    message db "Hello, World!", 0x0a  ; 0x0a means a newline character
    length equ $ - message             ; Calculate the length of the message

section .text
    ; The linker entrypoint is defined here.
    global _start

_start:
    ; Assume we are calling write(1, message, length)
    mov rax, 1        ; System call number 1 means we want to use write()
    mov rdi, 1        ; The destination is stdout (file descriptor 1)
    mov rsi, message  ; The message source points to the message bytes
    mov rdx, length   ; Number of bytes to write
    syscall           ; Invoke the kernel system call

    ; To exit, we call syscall with code 60
    mov rax, 60       ; System call number 60 is sys_exit
    xor rdi, rdi      ; Exit code 0. In XOR, any value XORed with itself equals 0
    syscall           ; Invoke the exit system call
```

---

## How to Assemble and Run the Program

### Prerequisites
You need to have NASM (Netwide Assembler) and a linker installed on your Linux system.

**Install on Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install nasm
```

**Install on Fedora/RHEL:**
```bash
sudo dnf install nasm
```

**Install on Arch Linux:**
```bash
sudo pacman -S nasm
```

### Steps to Compile and Run

1. **Save the code** to a file named `hello.asm`

2. **Assemble the code** into an object file:
```bash
nasm -f elf64 hello.asm -o hello.o
```
   - `-f elf64`: Specifies the output format as 64-bit ELF (Executable and Linkable Format)
   - `hello.asm`: Your source file
   - `-o hello.o`: Output object file

3. **Link the object file** to create an executable:
```bash
ld hello.o -o hello
```
   - `ld`: The GNU linker
   - `hello.o`: Your object file
   - `-o hello`: Output executable name

4. **Run the program**:
```bash
./hello
```

You should see the output:
```
Hello, World!
```

5. **Check the exit code** (optional):
```bash
echo $?
```
This should display `0`, confirming the program exited successfully.

### One-Line Compilation (Optional)
You can combine the assembly and linking steps:
```bash
nasm -f elf64 hello.asm -o hello.o && ld hello.o -o hello && ./hello
```

### Troubleshooting

- **Permission denied**: Make sure the file is executable:
  ```bash
  chmod +x hello
  ./hello
  ```

- **Command not found**: Ensure NASM and ld are installed and in your PATH

- **Wrong architecture**: This code is specifically for x86-64 Linux. It won't work on 32-bit systems or other operating systems without modifications.

---

## Register Explanations

Here's a detailed breakdown of the key x86-64 registers:

**General Purpose Registers:**

- **RAX** (Accumulator): Primary register for arithmetic operations, system call numbers, and return values
- **RBX** (Base): General purpose, often used for base pointer in memory operations
- **RCX** (Counter): Used for loop counters and string operations
- **RDX** (Data): General purpose, used for I/O operations and as third argument in system calls
- **RDI** (Destination Index): Used as first argument in function/system calls, destination pointer in string operations
- **RSI** (Source Index): Used as second argument in function/system calls, source pointer in string operations
- **RBP** (Base Pointer): Points to the base of the current stack frame
- **RSP** (Stack Pointer): Points to the top of the stack
- **R8-R15**: Additional general purpose registers available in x86-64

Each of these 64-bit registers can also be accessed in smaller sizes:
- Lower 32 bits: EAX, EBX, ECX, etc.
- Lower 16 bits: AX, BX, CX, etc.
- Lower 8 bits: AL, BL, CL, etc. (and AH, BH, CH for upper 8 bits of the lower 16)
