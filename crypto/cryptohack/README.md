Encoding
	
	1.ASCII:
	 	given an array of numbers converted to string using 
		"".join(chr(i) for i in a)

	2.HEX:		
		divide given hex string into group of two,convert each to base 10, then to ascii and join or simply use
		str.decode('hex') #refer to long_2_bytes.py

	3.Base64:	
		hex to ascii as above(.decode('hex')) and then used 
		.enocode('base64')

	4.Bytes_big:
		convert base10 to base16 using hex() then use str.decode('hex') then same as 2nd question # refer long_2_bytes.py
Xor

	1.Xor starter:
			"".join(chr(ord(i)^13) for i in "label")

	2.Xor properties:
		based on property that if C  = A XOR B  then  B XOR C = A
		converted KEY2^KEY3 and KEY1 to bytes using hex() xored both then 
		converted FLAG ^ KEY1 ^ KEY3 ^ KEY2 to bytes using hex(),xored above and this to get flag		

	3.Favourite byte: 
		k = "".join(chr(ord(j)^i) for j in g)
		0<i<=256
		g is given hex decoded ascii string 
		# refer xor_3.py 

	4.You either know XOR:
		converted hex to ascii string,then as output should start with "crypto{" found for which values
		(characters) the condition satisfies and found key was "myXORke" gave a guess added 'y', 
		# refer to xor_4.py