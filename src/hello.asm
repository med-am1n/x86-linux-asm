include 'format/format.inc'

format ELF64 executable

segment readable executable

start:
    mov     eax, 1
    mov     edi, 1
    lea     rsi, [message]
    mov     edx, message_end - message
    syscall

    mov     eax, 60
    xor     edi, edi
    syscall

segment readable

message db 'Hello from x86-64!', 10
message_end:
