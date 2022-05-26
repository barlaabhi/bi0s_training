# Single-byte XOR cipher
from score import scores
def hex_to_ascii(st):
	g2=[]
	for i in range(0,len(st)-1,2):
		g2.append(st[i]+st[i+1])

	k=""
	for i in g2:
		k += chr(int(i,16))
	return k

g = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

g = hex_to_ascii(g)
sc = {} 
for j in range(256):
	r = "".join(chr(ord(i)^j) for i in g)
	sc[r]=scores(r)

res = sorted(sc.items(), key=lambda x: x[1])
print(res[-10:])

	
