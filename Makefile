ANOLIS = anolis
PRINCE = prince

spec: source.html cross-spec-refs references
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --enable=xspecxref \
	--enable=refs $< $@

spec.pdf: spec
	$(PRINCE) -i html $< -o $@
