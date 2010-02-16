FORMAT = ../bin/format

export DRIVER_FILE = mcs

book: $(DRIVER_FILE)

%: %.pdf
	@

%.pdf: %.tex FORCE
	$(FORMAT) $*

FORCE: 

.PRECIOUS: %.pdf

.PHONY: all

all:
	for tex_file in *.tex; do \
		$(MAKE) $${tex_file%.tex}; \
	done

.PHONY: clean

clean:
	-rm -f $(DRIVER_FILE).pdf *.bbl *.blg *.toc *.dvi *.log *.ind *.idx *.idx.original *.ilg *.out *~

.PHONY: veryclean

veryclean: clean
	-rm -f *.aux *.pdf

.PHONY: showpolicy showsolutions hidesolutions togglesolutions asksolutions

showpolicy showsolutions hidesolutions togglesolutions asksolutions:
	$(MAKE) -C .. $@
