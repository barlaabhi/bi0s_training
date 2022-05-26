challenge: Too_much

file: [challenge_file](https://github.com/barlaabhi/Writeups/raw/main/darkCON_2021/Too_much/Too_much)

Solution:

The input we give is the flag if our input string satisfies the constraints  
Every character of input string of length 200 is passed into a function(a total of 200 functions)
Inside each function the following operation happens,

	k = each_char
	left =  BYTE (k<<4)
	right = BYTE (k>>4)
	some_value==(left+right)

what basically happens inside this function:

	say, the input character when converted in hex is 0xQW 
	so when we do a left shif by 4,it becomes 0xQW0 and taking a byte gives 
	left = 0xW0
	and performing a right shift makes 
	right = 0xQ (which will always be half byte)
	now when we add the final value will be 
	(left+right) =  0xWQ
	which is basically the reverse of the input char in hex we gave to this function

so now we have to find with what values our characters in input string are getting compared with,
to do this, we perform the following operations

```$ echo "disas main" | gdb ./Too_much | grep "call" |  tr -s " " | cut -d" " -f5 > file```

	file contains 
		<f122323>
		<f7093176>
		<f2267326>
		<f3113161>
		<f6910364>............

This gives us names of all functions, we will additionally have read,puts,stack_chk_fail at the end
which can be removed manually 

Using replace option in text editor we can replace all the `<` with `disas ` and remove `>`

	file now looks like
		disas f122323
		disas f7093176
		disas f2267326
		disas f3113161
		disas f6910364............		

```$ cat file | gdb ./Too_much | grep "cmp" | tr -s " " | cut -d" " -f 4 > file2```

	file2 contains 
	 	eax,0x46
		eax,0x16
		eax,0x27
		eax,0xb6
		eax,0x34............

using replace option we can filter out the values by removing ```eax,``` and push them into an array,
the following code gives the flag

```
array = [70, 22, 39, 182, 52, 244, 228, 183, 67, 39, 51, 245, 151, 3, 87, 245, 39, 51, 67, 198, 198, 151, 245, 71, 134, 19, 230, 182, 19, 230, 147, 245, 71, 134, 67, 71, 245, 151, 3, 87, 245, 54, 67, 230, 245, 71, 39, 151, 245, 71, 134, 19, 83, 245, 214, 67, 230, 87, 67, 198, 198, 151, 243, 243, 243, 245, 244, 182, 245, 148, 245, 71, 134, 19, 230, 182, 245, 151, 3, 87, 245, 38, 51, 71, 71, 51, 39, 245, 87, 55, 51, 245, 55, 3, 214, 51, 245, 22, 87, 71, 3, 214, 67, 71, 51, 70, 245, 71, 3, 3, 198, 55, 245, 198, 19, 182, 51, 245, 67, 230, 147, 39, 245, 3, 39, 245, 165, 51, 245, 71, 3, 245, 214, 67, 182, 51, 245, 151, 3, 87, 39, 245, 198, 19, 102, 51, 245, 214, 87, 54, 134, 245, 86, 67, 55, 19, 51, 39, 226, 52, 3, 230, 118, 39, 67, 71, 55, 245, 102, 3, 39, 245, 55, 3, 198, 103, 19, 150, 230, 147, 245, 71, 134, 51, 245, 86, 67, 55, 151, 245, 54, 134, 67, 198, 198, 51, 230, 118, 51, 215]

flag= ""

for i in array:
	p = hex(i)   			# convert each to hex
	p = p[2:]    			# remove 0x

	if len(p)!=2:
		p = '0'+ p   		# if it is half byte add 0

	p = p[::-1]			# reverse it 
	p = '0x'+ p			# add 0x  
	flag+=chr(int(p,16))    	# convert to ascii

print(flag) 
```


	darkCON{4r3_y0u_r34lly_th1nk1n9_th4t_y0u_c4n_try_th15_m4nu4lly???_Ok_I_th1nk_y0u_b3tt3r_us3_s0m3_aut0m4t3d_t00ls_l1k3_4n9r_0r_Z3_t0_m4k3_y0ur_l1f3_much_e4s13r.C0ngr4ts_f0r_s0lv1in9_th3_e4sy_ch4ll3ng3}
