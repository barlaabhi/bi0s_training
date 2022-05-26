from itertools import cycle
g = "0e0b213f26041e480b26217f27342e175d0e070a3c5b103e2526217f27342e175d0e077e263451150104"

# splitting given hex string to group of two
g2=[]
for i in range(0,len(g)-1,2):
	g2.append(g[i]+g[i+1])

#converting each group from base16 to base10 and then to ascii 
g=""
for i in g2:
	g += chr(int(i,16))

# since result starts with "crypto{"
# took first  7 characters of ascii string "g" 
# then  xored each untill  letters of "crypto{" are found 
a = 0
key=""
for e in "crypto{":
	for i in range(256):
		k = "".join(chr(ord(g[a])^i))
		if e==k:
			a+=1
			print(k,chr(i))
			key+=chr(i)
			break
# now since we have the key xor and get the flag
a=0
key+='y' # guess
flag=""
for t in range(len(g)):
	flag += "".join(chr(ord(key[t%8])^ord(g[a])))
	a+=1


# or can use zip and cycle
flag = "".join(chr(ord(i)^ord(j)) for i,j in zip(g,cycle(key)))

print(flag)