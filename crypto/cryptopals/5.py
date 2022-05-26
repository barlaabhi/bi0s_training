#challenge 5 

from itertools import cycle

a = '''Burning 'em, if you ain't quick and nimble
I go crazy when I hear a cymbal'''


b = "ICE"

k = "".join(chr(ord(i)^ord(j)) for i,j in zip(a,cycle(b)))

'''cycle(b) will create a string of length 'a' by 
   repeatedly adding the string b 
   so now since both lengths are equal zip will 
   pair every character of 'a' with a character of 'b'

'''

print(k.encode('hex'))