BITS 32

extern scanf
extern printf

section .data
	
	spec: db "%d",0
	a: db "sum is %d",10,0
	b: db "difference is %d",10,0
	m: db "product is %d",10,0
	d: db "quotient is %d",10,0
	r: db "remander is %d",10,0

section .text
	
	global main

main:
	push ebp
	mov ebp,esp
	sub esp,0x10		;reserving space

	; taking 1st number

	lea eax,[ebp-0x4]  
	push eax
	push spec
	call scanf

	; taking 2nd number

	lea eax,[ebp-0x8]
	push eax
	push spec
	call scanf

	;add

	mov eax,DWORD [ebp-0x4]
	mov ebx,DWORD [ebp-0x8]
	add eax,ebx
	
	push eax
	push a
	call printf

	;sub

	mov eax,DWORD [ebp-0x4]
	mov ebx,DWORD [ebp-0x8]
	sub eax,ebx

	push eax
	push b
	call printf

	;mul used imul(signed int mul)

	mov eax,DWORD [ebp-0x4]
	mov ebx,DWORD [ebp-0x8]
	imul eax,ebx

	push eax
	push m
	call printf

	;div(32 bit)

	xor edx,edx
	mov eax,DWORD [ebp-0x4]
	mov ebx,DWORD [ebp-0x8]
	div ebx

	mov DWORD[ebp-0xc],eax
	mov DWORD[ebp-0x10],edx

	push DWORD[ebp-0xc]
	push d
	call printf

	push DWORD[ebp-0x10]
	push r
	call printf

	mov esp, ebp
    pop ebp
        
    mov eax, 1
    int 80h