CC=gcc
CFLAGS=-O2 -Wall -Wextra -std=c99 -march=native -mtune=native
LDFLAGS=

SRC=2pin.c dil.c main.c pcb_element.c qfp.c so.c conn.c
OBJ=$(SRC:.c=.o)
BIN=fpgen

all: $(BIN)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

$(BIN): $(OBJ)
	$(CC) $(LDLAGS) -o $@ $(OBJ) -lm

clean:
	rm -f $(OBJ) $(BIN)

strip: $(BIN)
	strip --strip-all --strip-unneeded --strip-debug --discard-all --discard-locals --remove-section=.comment --remove-section=.note $(BIN)
