# Customize below to fit your system

PREFIX = /usr/local/share/emacs/lisp

all: st.el
	echo $(PREFIX)

install: st.el
	mkdir -p $(DESTDIR)$(PREFIX)/term/
	cp st.el $(DESTDIR)$(PREFIX)/term/

uninstall:
	rm -p $(DESTDIR)$(PREFIX)/term/st.el

.PHONY: install uninstall
