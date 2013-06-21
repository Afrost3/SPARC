	.section ".data"









.global main
main:	
	save %sp,-96,%sp
	mov 1,%l0
	clr %l2
loop:	mov %l0,%o0
	call .mul
	mov %l0,%o1
	call .mul
	mov 3,%o1
	mov %o0,%l1
	mov 40,%o0
	call .mul
	mov %l0,%o1
	sub %o0,15,%o0
	add %l1,%o0,%l1
	add %l2,%l1,%l2

	set string,%o0
	mov %l0, %o1
	mov %l1,%o2
        call printf

	inc %l0
	cmp %l0,10
	ble loop
	nop
	set string2,%o0
        call printf
	mov %l2, %o1

	ret
	restore
string:
.asciz "The value for x = %d is %d\n"

string2:
.asciz "The overall result is y = %d\n"
