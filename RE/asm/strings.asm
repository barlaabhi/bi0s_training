BITS 32 
extern scanf
extern printf	

section .data

	spec: db "%s",0
	st: db "%c",10,0
	
section .text

	global main

main:
	
	push ebp
	mov  ebp,esp
	sub  esp,0x10

	lea  eax,[ebp-0xc]
	push eax
	push spec
	call scanf

	lea esi,[ebp-0xc]
	jmp part_b

part_a:
	
	movsx ecx,al
	push ecx
	push st
	call printf

part_b:
	xor eax,eax   ;because of function call
	lodsb 
	cmp al,0
	jne part_a


	mov esp, ebp
    pop ebp
        
    mov eax, 1
    int 80h





;nasm -f elf -g strings.asm

;ld -melf_i386 -e main -dynamic-linker /lib/ld-linux.so.2 -o strings strings.o -lc



