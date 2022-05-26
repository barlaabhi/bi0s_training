from Crypto.Cipher import AES

import base64

with open('7.txt') as f:
	#k = base64.b64decode(f.read())
	inp_text = f.read().decode('base64')

mod = AES.new("YELLOW SUBMARINE",AES.MODE_ECB)

result = mod.decrypt(inp_text)

print(result)
