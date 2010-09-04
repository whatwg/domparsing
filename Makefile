ANOLIS = anolis
PRINCE = prince

all: domparser domparser.pdf xrefs.json

domparser: source.html cross-spec-refs references
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --enable=xspecxref \
	--enable=refs $< $@

domparser.pdf: domparser
	$(PRINCE) -i html $< -o $@

xrefs.json: source.html
	$(ANOLIS) --dump-xrefs $< /tmp/spec
