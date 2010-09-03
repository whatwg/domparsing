ANOLIS = anolis
PRINCE = prince

all: spec spec.pdf xrefs.json

spec: source.html cross-spec-refs references
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --enable=xspecxref \
	--enable=refs $< $@

spec.pdf: spec
	$(PRINCE) -i html $< -o $@

xrefs.json: source.html
	$(ANOLIS) --dump-xrefs $< /tmp/spec
