	.section ".data"
define(xmax,10)
define(a0,3)
define(a1,40)
define(a2,15)

define(x_r,l0)
define(y_r,l1)
define(z_r,l2)

.global main
main:	
	save %sp,-96,%sp
	mov 1,%x_r
	clr %z_r
loop:	mov %x_r,%o0
	call .mul
	mov %x_r,%o1
	call .mul
	mov a0,%o1
	mov %o0,%y_r
	mov a1,%o0
	call .mul
	mov %x_r,%o1
	sub %o0,a2,%o0
	add %y_r,%o0,%y_r
	add %z_r,%y_r,%z_r

	set string,%o0
	mov %x_r, %o1
	mov %y_r,%o2
        call printf

	inc %x_r
	cmp %x_r,10
	ble loop
	nop
	set string2,%o0
        call printf
	mov %z_r, %o1

	ret
	restore
string:
.asciz "The value for x = %d is %d\n"

string2:
.asciz "The overall result is y = %d\n"
