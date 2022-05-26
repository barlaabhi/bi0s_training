BITS 32

extern scanf
extern printf

section .data
	
	spec: db "%d",0
	a: db "%d is prime",10,0
	b: db "%d is not prime",10,0

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

	mov ecx,DWORD [ebp-0x4]
	mov ebx,2
	jmp part_b

part_a:
	mov eax,DWORD[ebp-0x4] 
	xor edx,edx
	div ebx

	cmp edx,0
	je	NOT_PRIME
	
	inc ebx
part_b:
	cmp ebx,ecx
	jl part_a

	;prime
	push DWORD[ebp-0x4]
	push a
	call printf

	jmp Done


NOT_PRIME:
	push DWORD[ebp-0x4]
	push b
	call printf

Done:
	mov esp,ebp
	pop ebp

	mov eax,1
	int 80h






