nasm -f elf32 -o asmMedia32.o asmMedia32.asm
gcc -m32 laboratorio0-p1.c asmMedia32.o -o prueba1
./prueba1 2 3 1