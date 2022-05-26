from score import scores
def hex_to_ascii(st):
	g2=[]
	for i in range(0,len(st)-1,2):
		g2.append(st[i]+st[i+1])

	k=""
	for i in g2:
		k += chr(int(i,16))
	return k

f = open("4.txt","r")
e = f.readlines()

sc={}
for y in e:
	k = hex_to_ascii(y)

	for j in range(256):
		r = "".join(chr(ord(i)^j) for i in k)
		sc[r]=scores(r) 	

res = sorted(sc.items(), key=lambda x: x[1])
print(res[-10:])
