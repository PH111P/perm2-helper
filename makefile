CC=g++
LDFLAGS=-lpng
CPPFLAGS=-c -std=c++17 -O2 -Wall
SOURCES=bitmap.cpp
OBJECTS=$(SOURCES:.cpp=.o)

all: png2raw raw2png npl2rsd clean imgbin2raw

imgbin2raw: $(OBJECTS) imgbin2raw.o
	$(CC) imgbin2raw.o -o $@

png2raw: $(OBJECTS) png2raw.o
	$(CC) $(LDFLAGS) png2raw.o $(OBJECTS) -o $@

pkmnicon2rsd: $(OBJECTS) pkmnicon2rsd.o
	$(CC) $(LDFLAGS) pkmnicon2rsd.o $(OBJECTS) -o $@

raw2png: $(OBJECTS) raw2png.o
	$(CC) $(LDFLAGS) raw2png.o $(OBJECTS) -o $@

npl2rsd: npl2rsd.o
	$(CC) npl2rsd.o -o $@

.cpp.o:
	$(CC) $(CPPFLAGS) $< -o $@

clean:
	rm -rf *o
