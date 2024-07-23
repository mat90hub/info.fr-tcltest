# to force renew:  make -B img

.DELETE_ON_ERROR:
SHELL = /bin/bash

MASTER=tcltest.fr
SOURCE=tcltest.fr.texinfo
COL=37  # column to start description

INFO_PATH=/usr/local/share/info/


info: $(SOURCE)
	texi2any --info --output=$(MASTER).info --document-language=fr_FR $(SOURCE)

install: info
	gzip -f *.info
	cp *.info*.gz -t $(INFO_PATH)
	rm -f *.info*.gz
	install-info --keep-old --calign=$(COL) $(INFO_PATH)/$(MASTER).info.gz $(INFO_PATH)/dir

all: install

.PHONY : all clean info install
clean:
	rm -f *.info*
	rm -f *~
	rm -f *.gz

