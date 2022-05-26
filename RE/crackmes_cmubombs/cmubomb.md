
phase_1

this phase just has a strcmp which checks the input string with

	input: "Public speaking is very easy."


phase_2

this phase checks that the six numbers we input are first six fibonacci numbers

	input: 1 2 6 24 120 720

phase_3

this phase will take two integers and a character and checks them with the values in below table, any set would solve the phase

input: 
	
	0 q 777
	1 b 214
	2 b 755
	3 k 251
	4 o 160
	5 t 458
	6 v 780
	7 b 524


phase_4

to solve this phase the integer given as input say n,when passed through the recursive function "func4" should return 0x37(55), the function basically return nth fibonacci number, so the value of n such that the return value is 55 is 9
and the second part of the input is not used in this phase but, the second part has to be "austinpowers" inorder to pass phase_defuse

	input: 9 austinpowers


phase_5

each character of the input string is AND-ed with 15 and the output value of AND operation is taken as an index of a string 
resultant concatenated string is compared with 'gaints'

brute-forcing we get 
 
any of the below values, should pass the phase

input: 
	 

	'\x1f' /  ?  O  _  o 
	" "    0  @  P  `  p 
	%      5  E  U  e  u 
	+      ;  K  [  k  { 
	-      =  M  ]  m  } 
	!      1  A  Q  a  q 




phase_6

reads six numbers

first part of the functions checks weather each number is less than 6
and makes sure that no two numbers are equal

there is an implemented linked list with 6 nodes each of size 12 bytes
where first 8 bytes contain some values and the last 4 contain the address of next node
 
the further part of the function creates a new linked list such that it re-arranges the nodes of the original linked list in the order of the numbers inputted 

and then a check happens such that the first 4 bytes of a node is grater than the first 4 bytes of its next node
which is basically the descending order on basis of first 4 bytes of re-arranged linked list

	input : 4 2 6 3 1 5


phase_defused

this phase first makes sure that the string given along with the input in the phase_4 is "austin powers" 
and then it moves to secret phase where we read an integer(input_num) and send it as an argument along with an address(edx) to the recursive function fun7, which looks like 


		def fun7(edx,input_num):
			if edx==0:
				return -1

			if input_num >= DWORD[edx]:
			
				if input_num == DWORD[edx]:
					return 0
					
				return 2 * fun7( DWORD[edx+8] , input_num ) + 1      #This_one
				
			return 2 * fun7( DWORD[edx+4] , input_num ) 


here the address passed is address of a node of size 12 bytes which holds an integer of 4 bytes and 2 addresses of 4 bytes each 

inorder to pass this phase, this function should have a return value of 7


since fun7 should return 7 and 7 is odd

		the control must go to #This_one
		
		return (2 * (3) + 1) 
		to get 7, fun7( DWORD[edx+8] , input_num ) must return 3
		edx is address of node n1 

since fun7 should return 3 and 3 is odd

		the control must again go to #This_one
	
		return (2 * (1) + 1) 
		to get 3, fun7( DWORD[edx+8] , input_num ) must return 1
		edx is address of node n22

since fun7 should return 1 and 1 is odd

		the control must again go to #This_one

		return (2 * (0) + 1)
		to get 1, fun7( DWORD[edx+8] , input_num ) must return 0
		edx is address of node n34 

	it returns 0 only when ( DWORD[edx+8] , input_num)  are equal 
	here edx+0x8 is address of node n48 whose DWORD[edx+8] is 0x3e9

so the input must be 1001 in order to pass this phase

	input : 1001

