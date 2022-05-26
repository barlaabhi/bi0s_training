
g = "73626960647f6b206821204f21254f7d694f7624662065622127234f726927756d"

# splitting given hex string to group of two
g2=[]
for i in range(0,len(g)-1,2):
	g2.append(g[i]+g[i+1])

#converting each group from base16 to base10 and then to ascii 
g=""
for i in g2:
	g += chr(int(i,16))


''' Xored each character of above ascii string 'g' with 
	all 256 possibilities and printed the xored string with 
	word "crypto" in it 
'''
for i in range(256):
	k = "".join(chr(ord(j)^i) for j in g)
	if "crypto" in k:
		print(k)