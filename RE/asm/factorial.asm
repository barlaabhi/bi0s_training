BITS 32

extern scanf
extern printf

section .data
	
	spec: db "%d",0
	a: db "factorial is %d",10,0

section .text
	
	global main

main:
	push ebp
	mov ebp,esp
	sub esp,0x8

	lea eax,[ebp-0x4]  
	push eax
	push spec
	call scanf


	mov eax,DWORD [ebp-0x4]
	mov ebx,1
	jmp part_b

part_a:
	imul ebx,eax
	dec eax
part_b:
	cmp eax,1
	jne part_a

	
	push ebx
	push a
	call printf

	mov esp, ebp
    pop ebp
        
    mov eax, 1
    int 80h



