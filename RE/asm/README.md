# RE
There seems to be a issue with my machine
I've used nasm to assemble and ld to link

To Assemble:

     nasm -f elf -g file_name.asm

To link object file and executable:

    ld -melf_i386 -e main -dynamic-linker /lib/ld-linux.so.2 -o file_name  file_name.o -lc
