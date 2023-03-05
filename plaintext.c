#define _POSIX_C_SOURCE 2
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static int plaintext(const char *path)
{
	FILE *f = stdin;
	if (path && strcmp(path, "-") != 0) {
		f = fopen(path, "rb");
		if (f == NULL) {
			perror(path);
			return 1;
		}
	}

	int c = 0;
	while ((c = fgetc(f)) != EOF) {
		if (c == '\033') {
			c = fgetc(f);	/* read '[' */
			c = '\033';
			while (c != EOF && ! (0x40 <= c && c <= 0x7e)) {
				c = fgetc(f);
			}
			continue;
		}
		if (iscntrl(c) && !isspace(c)) {
			continue;
		}
		putchar(c);
	}

	if (f != stdin) {
		fclose(f);
	}
	return 0;
}

int main(int argc, char *argv[])
{
	int c;
	while ((c = getopt(argc, argv, "")) != -1) {
		switch (c) {
		default:
			return 1;
		}
	}

	if (optind >= argc) {
		return plaintext(NULL);
	}

	int r = 0;
	for (int i = optind; i < argc; i++) {
		r |= plaintext(argv[i]);
	}
	return r;
}
