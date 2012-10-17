# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis

all: domparser ../xref/xrefs/dom/domps.json

domparser: source.html ../xref Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --enable=xspecxref \
	--enable=refs --use-strict --xref="../xref" $< $@

../xref/xrefs/dom/domps.json: source.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
