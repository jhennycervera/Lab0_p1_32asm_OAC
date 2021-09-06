nasm -f elf32 -o asmMedia32.o asmMedia32.asm
nasm -f elf32 -o asmMedia32womin.o asmMedia32womin.asm
gcc -m32 laboratorio0-p2.c asmMedia32.o asmMedia32womin.o -o prueba2
./prueba2 1 2 3