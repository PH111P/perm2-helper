CC=g++
LDFLAGS=-lpng
CPPFLAGS=-c -std=c++17 -Wall -DNUM_LANGUAGES=2 -DMAX_ITEMS_PER_DIR=30 -g3 -ggdb
SOURCES=bitmap.cpp fsdata.cpp
OBJECTS=$(SOURCES:.cpp=.o)

all: normalizepkmnicon ampal2p2l csvjoin csvjoin2 png2raw 128x32raw plat2raw sprite2raw pkmnsprite2raw pkmnicon2rsd raw2png raw2sprite

normalizepkmnicon: $(OBJECTS) normalizepkmnicon.o
	$(CC) $(LDFLAGS) normalizepkmnicon.o $(OBJECTS) -o $@

ampal2p2l: $(OBJECTS) ampal2p2l.o
	$(CC) ampal2p2l.o -o $@

csvjoin: $(OBJECTS) csvjoin.o
	$(CC) csvjoin.o -o $@

csvjoin2: $(OBJECTS) csvjoin2.o
	$(CC) csvjoin2.o -o $@

png2raw: $(OBJECTS) png2raw.o
	$(CC) $(LDFLAGS) png2raw.o $(OBJECTS) -o $@

128x32raw: $(OBJECTS) 128x32raw.o
	$(CC) $(LDFLAGS) 128x32raw.o $(OBJECTS) -o $@

plat2raw: $(OBJECTS) plat2raw.o
	$(CC) $(LDFLAGS) plat2raw.o $(OBJECTS) -o $@

sprite2raw: $(OBJECTS) sprite2raw.o
	$(CC) $(LDFLAGS) sprite2raw.o $(OBJECTS) -o $@

pkmnsprite2raw: $(OBJECTS) pkmnsprite2raw.o
	$(CC) $(LDFLAGS) pkmnsprite2raw.o $(OBJECTS) -o $@

pkmnicon2rsd: $(OBJECTS) pkmnicon2rsd.o
	$(CC) $(LDFLAGS) pkmnicon2rsd.o $(OBJECTS) -o $@

raw2png: $(OBJECTS) raw2png.o
	$(CC) $(LDFLAGS) raw2png.o $(OBJECTS) -o $@

raw2sprite: $(OBJECTS) raw2sprite.o
	$(CC) $(LDFLAGS) raw2sprite.o $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CPPFLAGS) $< -o $@

clean:
	rm -rf *o
