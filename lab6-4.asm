%include 'in_out.asm'

SECTION .data
expr: DB 'Вычисление выражения f(x) = (9x - 8)/8',0
msg:  DB 'Введите значение x: ',0
res:  DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
    mov eax, expr
    call sprintLF

    mov eax, msg
    call sprint

    mov ecx, x
    mov edx, 80
    call sread

    mov eax, x
    call atoi

    ; Вычисление f(x) = (9x - 8)/8
    mov ebx, 9
    mul ebx         ; EAX = 9 * x
    sub eax, 8      ; EAX = 9 * x - 8
    xor edx, edx    ; обнуление EDX перед делением
    mov ebx, 8
    div ebx         ; EAX = (9 * x - 8) / 8

    mov edi, eax    ; сохраняем результат

    mov eax, res
    call sprint
    mov eax, edi
    call iprintLF

    call quit
