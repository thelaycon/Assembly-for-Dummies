# Chapter 2: Basic Arithmetic

In this chapter, we explore basic arithmetic operations in x86-64 assembly. Just as high-level languages allow you to add, subtract, multiply, and divide variables, assembly provides specific instructions to perform these operations on registers.

We will cover the following instructions:
- `add`: Addition
- `sub`: Subtraction
- `div`: Unsigned Division
- `idiv`: Signed Division

## Addition (`add`)

The `add` instruction adds the value of the source operand to the destination operand and stores the result in the destination.

**Syntax:** `add destination, source`

Example from `add.asm`:
```asm
mov rax, 5    ; Put 5 in rax
mov rbx, 6    ; Put 6 in rbx
add rax, rbx  ; Add rbx to rax (rax = 5 + 6 = 11)
```

In the example provided (`add.asm`), the result (11) is moved to the `rdi` register to be used as the program's exit code.

## Subtraction (`sub`)

The `sub` instruction subtracts the source operand from the destination operand and stores the result in the destination.

**Syntax:** `sub destination, source`

Example from `sub.asm`:
```asm
mov rax, 5    ; Put 5 in rax
mov rbx, 6    ; Put 6 in rbx
sub rax, rbx  ; Subtract rbx from rax (rax = 5 - 6 = -1)
```

**Note on Negative Numbers:** In the example (`sub.asm`), the result is -1. When used as an exit code in Linux, this value is treated as an unsigned 8-bit integer. Therefore, `echo $?` will display `255` (which is the unsigned byte representation of -1) rather than `-1`.

## Division

Division in x86-64 assembly is slightly more complex because it uses a combined register pair (`rdx:rax`) for the dividend (the number being divided). The quotient is stored in `rax` and the remainder in `rdx`.

### Unsigned Division (`div`)

Used for dividing positive integers.

**Important:** You must zero out the `rdx` register before executing `div` to ensure the dividend is effectively just the value in `rax`.

Example from `div_unsigned.asm`:
```asm
xor rdx, rdx  ; Clear rdx register (set to 0)
mov rax, 10   ; Dividend
mov rbx, 3    ; Divisor
div rbx       ; Divide rdx:rax by rbx
              ; Result: rax = 3 (quotient), rdx = 1 (remainder)
```

### Signed Division (`idiv`)

Used for dividing integers that may be negative.

**Important:** Instead of clearing `rdx`, you must sign-extend the value in `rax` into `rdx`. The `cqo` (Convert Quad to Oct) instruction does this automatically. It copies the sign bit of `rax` into every bit of `rdx`.

Example from `div_signed.asm`:
```asm
mov rax, -10  ; Dividend
mov rbx, 3    ; Divisor
cqo           ; Sign-extend rax into rdx
idiv rbx      ; Divide rdx:rax by rbx
              ; Result: rax = -3
```

---

## How to Assemble and Run the Programs

The process is identical to Chapter 1. You can compile each `.asm` file individually.

### Prerequisites
Ensure NASM and a linker (ld) are installed (refer to Chapter 1).

### Steps to Compile and Run

1. **Assemble** the source file:
   ```bash
   nasm -f elf64 add.asm -o add.o
   ```

2. **Link** the object file:
   ```bash
   ld add.o -o add
   ```

3. **Run** the executable:
   ```bash
   ./add
   ```

4. **Check the Result**:
   Since these programs don't print text to the screen, they return their result as the **exit code**. You can verify the operation worked by checking the last exit code immediately after running the program:
   ```bash
   echo $?
   ```

### Quick Compilation for All Examples

You can try the other files (`sub.asm`, `div_unsigned.asm`, `div_signed.asm`) using the same steps.

**For `sub.asm`:**
```bash
nasm -f elf64 sub.asm -o sub.o && ld sub.o -o sub && ./sub
echo $?
# Output should be 255 (representing -1)
```

**For `div_unsigned.asm`:**
```bash
nasm -f elf64 div_unsigned.asm -o div_unsigned.o && ld div_unsigned.o -o div_unsigned && ./div_unsigned
echo $?
# Output should be 3 (10 / 3 = 3)
```
