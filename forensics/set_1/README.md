Detailed View:
		
	We here have a png file, so we first bascially run pngcheck, Everything's fine
	now we check for hidden data, we have a command 'strings' which will print the printable
	characters in the file, when we run the command we get a url which has base64 encoded string 
	which when decoded gives the flag(we can also see url in ghex)

Con-the-Cat:

	We have a png file,when we do pngcheck we get an error saying we are having additional 
	chunks after IEND,so when we ghex this file we see much data after IEND chunk,it seems like 
	much data is hidden, so lets do binwalk to see weather it has any embedded files,we see 4 JPEG 
	files,so lets extract them using 'dd' tool,we see the flag directly in first image 

Back to San Andreas:
		
	Reading the description carefully, we see JSTEG in caps,so when we run jsteg, we get to know 
	the hidden data is a url,from which we directly get the flag

Snow Snow:
		
	we are given text, so when we copy the text we see something unusual with spaces,
	we have a tool named stegsnow to hide text using tabs and spaces, using the tool we get the flag

Security 101:
	
	we are given a zip file which when extracted has two files one protected zip and one image,
	and in the challenge description we are given a hint that " Some people keep their username as password",
	so lets try finding the username,which usually resides in metadata,giving the same creator name as password 
	to zip, we directly see the flag in the image

The Office Trouble 1:

	we are provided a protected zip file,using fcrackzip to crack the zip(dictionary attack)
	we get the password,opening the image inside zip gives us the flag

You can't see me:

	we are given a png image,first step:pngcheck, it throws an error "CORRUPTED by text conversion", 
	so lets go check the chunks using ghex, here we see many incorrect chunks (magic numbers,IHDR,gAMA,IDAT,IEND) 
	correcting them we see flag in the image

Always Has been:

	We are provided a png file,from the description we can understand it is something related to planes,
	So when we try checking the file in stegsolve we see the flag

10111001:
		
	From the description we are given a hint,to look at significant bytes, using Zsteg we see the 
	flag encrypted in base32, decoding the text we get the flag

My-First-Stegnography:
		
	we are given two files and it is said that the message is transmitted through image, 
	steghide is a tool hide and extract  messages(text) in images,using steghide for image_1 with 
	empty passphrase we get passphrase for second image, which when used with image_2 gives the flag

Jay-Chot:

	We are given a jpg file,when we open the file we get an error saying it couldn't load, so lets go 
	ghex the file, checking Header and Footer and adjusting them, we'll be able to open the image and see the flag

#Reference for all the above tasks wiki.bi0s.in 
