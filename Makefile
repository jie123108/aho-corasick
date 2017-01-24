LIBNAME := libahocorasick.a
SONAME := libahocorasick.so 

CFLAGS := -Wall -fPIC
HEADERS := actypes.h ahocorasick.h node.h

all: $(LIBNAME) $(SONAME)

$(LIBNAME): ahocorasick.o node.o
	ar -cvq $(LIBNAME) ahocorasick.o node.o

$(SONAME): ahocorasick.o node.o
	gcc $(CFLAGS) -shared -ldl  $^ -o $@

ahocorasick.o: ahocorasick.c $(HEADERS)
	gcc -g -c $< $(CFLAGS)

node.o: node.c $(HEADERS)
	gcc -g -c $< $(CFLAGS)

clean:
	rm -f *.o $(LIBNAME) test *.so
