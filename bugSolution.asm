; Corrected assembly code with bounds checking
section .data
    array dw 10, 20, 30, 40, 50 ;Example array
    array_size equ ($ - array) / 2 ;Size of array in words
section .text
    global _start

_start:
    mov ebx, array ; Base address of the array
    mov ecx, 2  ; Index to access (example)

    ; Bounds check
    cmp ecx, array_size
    jge error_handler ; Handle error if index is out of bounds
    
    ; Calculate address with bounds check
    mov eax, ecx
    imul eax, 2 ; Multiply by 2 since each element is a word (2 bytes)
    add eax, ebx ; Add the offset to the base address

    mov dx, [eax] ; Access the array element safely
    ; ... further code using dx

jmp exit_program

error_handler:
    ; Handle the out of bounds error (e.g., exit with an error code)
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

exit_program:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80