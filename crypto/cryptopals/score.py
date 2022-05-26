def scores(a):
	g = len(a)
	a = a.upper()
	chars = ", .'!"
	chr_fr = {'E': 12.702,'T': 9.056,'A': 8.167,'O': 7.507, 'I': 6.966,'N': 6.749,'S': 6.327,'H':6.094,'R':5.987,'D':4.253,'L':4.025}
	count=0
	for i in a:
		if i in chr_fr:
			count+=chr_fr[i]
		elif(ord(i)>64 and ord(i)<91):
			count+=1
		elif i in chars:
			count+=0.5
	
	return int(count)




