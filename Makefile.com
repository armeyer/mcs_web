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
	-rm -f $(DRIVER_FILE).pdf *.bbl *.blg *.toc *.dvi *.log *.ind *.idx *.ilg *.out *~

.PHONY: veryclean

veryclean: clean
	-rm -f *.aux *.pdf

.PHONY: showsolutions hidesolutions asksolutions

showsolutions hidesolutions asksolutions:
	$(MAKE) -C .. $@

# 000010160008
