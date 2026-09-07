# x86-linux-asm

 A small, portable x86-64 Linux assembly environment for macOS Apple Silicon.

 The repository includes:

- `fasmg` — assembler
- `elfuse` — runs x86-64 Linux ELF binaries on Apple Silicon macOS
- FASM/fasmg x86 include files
- Official fasmg documentation
- A simple `Makefile` for building and running programs

## Architecture

![Architecture](architecture.png)
 ## Requirements

- Apple Silicon Mac
- macOS with Rosetta available
- `make`
- `greadelf` for optional ELF inspection

 ## Structure

```
.
├── bin/
│   ├── fasmg
│   └── elfuse
├── include/
│   └── ...
├── docs/
│   └── ...
├── src/
│   └── hello.asm
├── build/
├── Makefile
└── README.md
```

 ## Build

```
make
```

 The ELF executable is produced in:

```
build/hello
```

 ## Run

```
make run
```

 Example:

```
Hello from x86-64!
```

 ## Inspect the ELF

```
make check
```

 Or directly:

```
greadelf -h build/hello
greadelf -lW build/hello
```

 ## Clean

```
make clean
```

 ## Portability

 The repository is self-contained: `fasmg`, `elfuse`, and the required include files live inside the repository.

 No global `PATH` or `INCLUDE` configuration is required.
 
 ### Included tools

 - **fasmg** — Flat Assembler Macro-Assembler\
   Version: `g.l8vn`\
   Source: official [fasmg](<https://flatassembler.net/docs.php?article=fasmg>) distribution
- **elfuse** — x86-64 Linux ELF runner for Apple Silicon macOS\
   Source: [sysprog21/elfuse](<https://github.com/sysprog21/elfuse>)

 The bundled binaries are the versions tested with this repository.

 Clone the repository and run:

```
make
make run
```

 > This setup targets Apple Silicon macOS and x86-64 Linux ELF binaries.
