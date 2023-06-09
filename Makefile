## TRIFAN BOGDAN-CRISTIAN, 312 CD
## PROIECT PCLP 3
CC = gcc
CFLAGS = -Wall -g
EXC = tema1

build: project

project: project.o  byte_string.o coada.o stiva.o  banda.o
	$(CC) $(CFLAGS) -o $(EXC) project.o byte_string.o coada.o stiva.o banda.o 

project.o: project.c macrouri.h byte_string.h  coada.h stiva.h banda.h
	$(CC) $(CFLAGS) -c project.c

coada.o: coada.c coada.h macrouri.h byte_string.h
	$(CC) $(CFLAGS) -c coada.c

stiva.o: stiva.c stiva.h banda.h
	$(CC) $(CFLAGS) -c stiva.c

banda.o: banda.c macrouri.h byte_string.h banda.h 
	$(CC) $(CFLAGS) -c banda.c

byte_string.o : byte_string.c byte_string.h 
	$(CC) $(CFLAGS) -c byte_string.c

run: build
	./$(EXC)

clean:
	rm -f *.o $(EXC)

archive:
	rm -rf *.zip
	zip -r project.zip Makefile README *.c *.h

zipper:
	cd ../; rm -rf SDA-tema1-optimisation.zip ; zip -r SDA-tema1-optimisation.zip SDA-tema1-optimisation/* ; cd ../

valgrind:
	valgrind --leak-check=yes --track-origins=yes ./tema1

coding_style:
	cd coding-style/ ; ./coding_style ../*.c ../*.h ; cd ../

check:
	./checker.sh

