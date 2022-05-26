1. b_challenge4.docx
								
		Found the flag when ran strings command with the above doc
		flag{h0wz_the_joke_hahahha!!}

2. E_challenge4jpg
		
		Here when we run exiftool to see meta data we see a base64 encoded string in comment,decoding it we get 
		hex string,decoding it to ascii we get the flag
		# base64.b64decode(string).decode('hex')
		inctf{y0u_g0t_7h3_fl4g}

3. FS_challenge4.png

		Here when we do png check we get an error,so when we ghex the image and correct the magic numbers, 
		we directly see the flag
		inctf{7h4nk5_for_h3lp1ng_m3}

4. s_challenge4.png
	
		Here when we run exiftool to see meta data we see a hex string in comment,
		decoding it we get base64 string,decoding it to ascii we get the flag
		flag{h4ck3rs_4r3_3v3rywh3r3}

5. SH_challenge4.jpg
	
		when we run strings with the file we get hex string,which when decoded to ascii gives gibberish,
		and we get nothing when we run other basic commands with the file,
		So when we decrypt the hex string in md5 we get "WEAREFREE",which is passphrase for steghide
		inctf{H4pPy_Ind3p3nD3nC3_D4Y}

6. SS_challenge4.png

		we have a tool to detect QR's in images "zbarimg",so when we run this with the file we get an 
		equation sort of thing,which doesn't seem to understand,so when we stegsolve this image and see it 
		in different planes we see a variation in the image,scanning one of them gives us the flag
		VolgaCTF{5t3g0_m4tr3shk4_in_4cti0n}

7. Z_challenge4.png

		As mentioned above,Using the tool "zbarimg", gives the flag
		flag{g00d_j0b_g33ks!!}
