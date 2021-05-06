; Programa para entrada de dados

SYS_EXIT  equ 1
RET_EXIT  equ 5
SYS_READ  equ 3
SYS_WRITE equ 4

;Entrada
STD_IN equ 0

;Saida
STD_OUT equ 1
MAX_IN equ 10

segment .data
    msg db "Entre com seu nome: ", 0xA, 0xD
    len equ $- msg
    
segment .bss ;Declaracao de iniciacoes
    nome resb 2

segment .text

global _start

_start:
;Saida de dados
;eax usa o e em conjunto(pode usar o r se for x64) 
    mov eax, SYS_WRITE ;ax acumulador para operacoes numericas
    mov ebx, STD_OUT   ;bx acumulador de registro base
    mov ecx, msg       ;cx registro de conta com operaçoes string
    mov edx, len       ;dx registro de dados
    int 0x80
    

;Entra de dados
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, MAX_IN ;Limite 10 caracteres
    int 0x80
    
exit:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT ;correspondente a xor ebx, ebx
    int 0x80