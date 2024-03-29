.POSIX:

# This Makefile was generated by maje
# See https://src.kaivo.net/dev/maje/ for more information
# Do not edit this Makefile by hand

CC=c99
LD=$(CC)
CFLAGS=-Wall -Wextra -Wpedantic -Werror -g
LDFLAGS=
LDLIBS=
SRCDIR=.
OBJDIR=.
BINDIR=$(OBJDIR)
LIBDIR=$(OBJDIR)
DESTDIR=/usr/local

all: $(BINDIR)/plaintext

clean:
	rm -f $(BINDIR)/plaintext $(OBJDIR)/*.o

install: $(BINDIR)/plaintext
	mkdir -p $(DESTDIR)/bin
	cp $(BINDIR)/plaintext $(DESTDIR)/bin

$(BINDIR)/plaintext: $(OBJDIR)/plaintext.o
$(OBJDIR)/plaintext.o: $(SRCDIR)/plaintext.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -o $@ -c $(SRCDIR)/plaintext.c

$(BINDIR)/plaintext:
	@mkdir -p $(@D)
	$(LD) $(LDFLAGS) -o $@ $(OBJDIR)/*.o $(LDLIBS)
