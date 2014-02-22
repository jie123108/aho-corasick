LIBNAME := libahocorasick.a

CFLAGS := -Wall -fPIC
HEADERS := actypes.h ahocorasick.h node.h

all: $(LIBNAME)

$(LIBNAME): ahocorasick.o node.o
	ar -cvq $(LIBNAME) ahocorasick.o node.o


ahocorasick.o: ahocorasick.c $(HEADERS)
	gcc -g -c $< $(CFLAGS)

node.o: node.c $(HEADERS)
	gcc -g -c $< $(CFLAGS)

clean:
	rm -f *.o $(LIBNAME) test *.so
