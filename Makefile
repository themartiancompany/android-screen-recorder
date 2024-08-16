#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-screen-recorder
DATA_DIR=$(DESTDIR)$(PREFIX)/share/android-screen-recorder
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-screen-recorder/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-android-screen-recorder install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-android-screen-recorder:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 android-screen-recorder/android-screen-recorder "$(BIN_DIR)"

.PHONY: check install install-doc install-android-screen-recorder shellcheck
