ANOLIS = anolis

all: domparser data/xrefs/dom/domps.json

domparser: source.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --enable=xspecxref \
	--enable=refs --use-strict $< $@

data/xrefs/dom/domps.json: source.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
