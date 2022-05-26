challenge: READ

file: [challenge_file](https://github.com/barlaabhi/Writeups/raw/main/darkCON_2021/read/read.pyc)

Solution:

**uncompyle6 gave .py file**
```
array = [73, 13, 19, 88, 88, 2, 77, 26, 95, 85, 11, 23, 114, 2, 93, 54, 71, 67, 90, 8, 77, 26, 0, 3, 93, 68]

key = 'you-may-need-this-key-1337'

flag = "".join(chr(ord(i)^j) for i,j in zip(key,array))
```
