1.Convert hex to base 64:

		decode given hex string to ascii using .decode('hex)
		then encode it to base64 using .encode('base64')
		# refer 1.py

2.Fixed Xor:

		given two hex strings to produce their Xor convert each hex string to base10 and 
		then xor both base 10 numbers then convert to hex
		# refer 2.py
3.Single-byte XOR cipher:
		
		Given a hex encoded string, we have to find the key(single byte) and the decrypted text
		First we convert given string to ascii string then we xor the whole given string with i where 0<i<256
		Now for the obtained 256 strings, we determine score by passing each string to the function scores()
		which determines score using character analysis and returns the value
		#refer score.py 
		We use dictionary to store each string(key) and its corresponding score(value),then sort the dictionary 
		by score(value) and then finally print last 10 items(score and string)
		#refer 3.py
		
4.Detect single-character XOR:
		
		here we read the given file using readlines() which will store each line as element(string)
		and return an array and now convert each string to ascii using hex_to_ascii() function
		and then xor the whole given string with i where 0<i<256 Now for the obtained 256 strings, 
		we determine score by passing each string to the function scores()
		which determines score using character analysis and returns the value
		#refer score.py 
		We use dictionary to store each string(key) and its corresponding score(value),then sort the dictionary 
		by score(value) and then finally print last 10 items(score and string)
		# refer 4.py

5.Implement repeating-key XOR:

		task is to xor a given string 'a' with given key 'b'
		here we can use
				"".join(chr(ord(i)^ord(j)) for i,j in zip(a,cycle(b)))
		so what above line does is cycle(b) will create a string of length 'a' by repeatedly adding the string b 
		now since both lengths are equal zip will pair every character of 'a' with each character of 'b' and 
		return each pair as tuples (zip basically returns iterator of tuples)
		(think 'a' and 'b' as sets containing characters and zip is something like one-one function)
		# refer 5.py
7. AES in ECB mode:

		Here the challenge is to decrypt given base_64 encoded text which is encrypted via AES in ECB mode
		so we take the input string and decode it from base64 using .decode('base64') or  base64.b64decode()
		and now we decrypt the encoded text
		# refer 7.py
		
		
