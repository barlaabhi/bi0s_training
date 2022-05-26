; to compile 
; nasm -f elf -g q2.asm
; ld -melf_i386 -e main -dynamic-linker /lib/ld-linux.so.2 -o q2  q2.o -lc

BITS 32

extern scanf
extern printf

section .data
	
	spec: db "%d",0
	a: db "Fibonacci-%d is %d",10,0

section .text
	
	global main

main:
	push ebp
	mov ebp,esp
	sub esp,0x10


	lea eax,[ebp-0x4]  
	push eax
	push spec
	call scanf

	
	mov eax,DWORD [ebp-0x4]		
	mov DWORD [ebp-0x8],1
	mov DWORD [ebp-0xc],1

	jmp part_b

part_a:

	mov ebx,DWORD [ebp-0x8] 
	mov ecx,DWORD [ebp-0xc]
	mov DWORD [ebp-0x8],ecx
	add ecx,ebx
	mov DWORD [ebp-0xc],ecx

	dec eax

part_b:
	cmp eax,2
	jg part_a

	mov ebx,DWORD [ebp-0xc]
	mov ecx,DWORD [ebp-0x4]
	push ebx
	push ecx
	push a
	call printf



	mov esp, ebp
    pop ebp
        
    mov eax, 1
    int 80h





