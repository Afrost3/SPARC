!Andrew Frost
!Assignment 2
!Dr. Anu Bourgeois
	.section ".data"
define(xmax,10)  !This is max value for x which is used in the loop
define(a0,3)     !These are the values for integers in the equation
define(a1,40)
define(a2,15)

define(x_r,l0)   !This is where the value of x is stored
define(y_r,l1)   !This is where I store the values for y currently
define(z_r,l2)	 !This is used to store the current sum of the equation

.global main
main:	
	save %sp,-96,%sp
	mov 1,%x_r   		!Setting x=1
	clr %z_r		!Clearing out z so that it is sure to be equal to 0
loop:	mov %x_r,%o0            !Start of the loop and moving x to register o0
	call .mul		!Calling the multiply before moving the value to o1 to save a nop
	mov %x_r,%o1		!This is how the x^2 is obtained
	call .mul		!Multiplying x^2 by the first constant again with the mov after mul
	mov a0,%o1		
	mov %o0,%y_r		!Now have y=ax^2 stored in the y_r register
	mov a1,%o0		!Moving the second constant for multiplying
	call .mul		!Same as before calling the mul before the seond move
	mov %x_r,%o1		!This moves x in so that we now have b*x
	sub %o0,a2,%o0		!Subtracting c from the previous answer and placing it back in the register
	add %y_r,%o0,%y_r	!Now adding the previous answer to the y_r register and now have answer
	add %z_r,%y_r,%z_r	!Adding the answer to z_r to update the sum 

	set string,%o0		!This is to display the value for x string
	mov %x_r, %o1		
	mov %y_r,%o2
        call printf

	inc %x_r		!This is where x is incremented
	cmp %x_r,10		!then compared
	ble loop		!branch if less than
	nop			!the only nop in the file, I didn't know if I could do without
	set string2,%o0		!This is at the end to display the overall result from z_r
        call printf
	mov %z_r, %o1

	ret
	restore
string:
.asciz "The value for x = %d is %d\n"	!String for displaying the solutions

string2:
.asciz "The overall result is y = %d\n" !String for displaying the final sum
