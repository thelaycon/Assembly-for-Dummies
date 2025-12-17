# Assembly-for-Dummies
Learn assembly for the x86-64 architecture from the first principles.

Hey, let's learn Assembly for x86-64. I'll be updating these repo with chapters on it. Do stick around.

## 🎒 Prerequisites
1.  A computer running **Linux** (or WSL on Windows, or macOS).
2.  A text editor (VS Code, Vim, Nano, or a steady hand and a magnet).
3.  **NASM** (The Assembler) and **GCC/LD** (The Linker).

### Installing Tools
**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install nasm build-essential
```
**Arch Linux:**
```bash
sudo pacman -S nasm base-devel
```

## 🗺️ The Curriculum (Folder Structure)

- **[Chapter 1: Understanding Registers](./chapter_1/README.md)**
  Learn about the CPU registers, basic movement of data, and your first Hello World.

- **[Chapter 2: Basic Arithmetic](./chapter_2/README.md)**
  Dive into addition, subtraction, multiplication, and the tricky business of division (signed vs. unsigned).

## 🤝 Contributing
Did you find a bug? Did I explain something so poorly that you got a headache?
1.  Fork the repo.
2.  Fix it.
3.  Submit a Pull Request.
4.  Receive virtual high-five.
---

*Remember: If your code Segfaults, it just means the computer is paying attention.*
