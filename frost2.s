!Andrew Frost
!Assignment 2
!Dr. Anu Bourgeois
	.section ".data"
  !This is max value for x which is used in the loop
     !These are the values for integers in the equation



   !This is where the value of x is stored
   !This is where I store the values for y currently
	 !This is used to store the current sum of the equation

.global main
main:	
	save %sp,-96,%sp
	mov 1,%l0   		!Setting x=1
	clr %l2		!Clearing out z so that it is sure to be equal to 0
loop:	mov %l0,%o0            !Start of the loop and moving x to register o0
	call .mul		!Calling the multiply before moving the value to o1 to save a nop
	mov %l0,%o1		!This is how the x^2 is obtained
	call .mul		!Multiplying x^2 by the first constant again with the mov after mul
	mov 3,%o1		
	mov %o0,%l1		!Now have y=ax^2 stored in the l1 register
	mov 40,%o0		!Moving the second constant for multiplying
	call .mul		!Same as before calling the mul before the seond move
	mov %l0,%o1		!This moves x in so that we now have b*x
	sub %o0,15,%o0		!Subtracting c from the previous answer and placing it back in the register
	add %l1,%o0,%l1	!Now adding the previous answer to the l1 register and now have answer
	add %l2,%l1,%l2	!Adding the answer to l2 to update the sum 

	set string,%o0		!This is to display the value for x string
	mov %l0, %o1		
	mov %l1,%o2
        call printf

	inc %l0		!This is where x is incremented
	cmp %l0,10		!then compared
	ble loop		!branch if less than
	nop			!the only nop in the file, I didn't know if I could do without
	set string2,%o0		!This is at the end to display the overall result from l2
        call printf
	mov %l2, %o1

	ret
	restore
string:
.asciz "The value for x = %d is %d\n"	!String for displaying the solutions

string2:
.asciz "The overall result is y = %d\n" !String for displaying the final sum
