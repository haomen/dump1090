CFLAGS?=-O2 -g -Wall -W $(shell pkg-config --cflags librtlsdr)
##$(shell pkg-config --libs librtlsdr)
LDLIBS+=-lrtlsdr -lpthread -lm
CC?=gcc
PROGNAME=dump1090

all: dump1090

%.o: %.c
	$(CC) $(CFLAGS) -c $<

dump1090: dump1090.o anet.o
	$(CC) -g -o dump1090 dump1090.o anet.o -L/usr/local/lib $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o dump1090
