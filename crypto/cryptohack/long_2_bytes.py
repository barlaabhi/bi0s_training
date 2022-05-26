# G is Long int
g = 159805433661873705497880084580614789222721324997857681199215485

g = hex(g)

g = g[2:-1]
# From here g is hex string

ga=[]
for i in range(0,len(g)-1,2):
	ga.append(g[i]+g[i+1])

g=""
for i in ga:
	g+= chr(int(i,16))

print(g)
