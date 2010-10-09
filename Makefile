ANOLIS = anolis
PRINCE = prince

all: domparser domparser.pdf xrefs.json

domparser: source.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --enable=xspecxref \
	--enable=refs --use-strict $< $@

domparser.pdf: domparser Makefile
	$(PRINCE) -i html $< -o $@

xrefs.json: source.html Makefile
	$(ANOLIS) --dump-xrefs $< /tmp/spec
