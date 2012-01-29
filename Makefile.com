ifndef MODE
	MODE = noftl
endif

FORMAT = ../bin/format -$(MODE)
# FORMAT = ../bin/format -exolinks

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
	-rm -f $(DRIVER_FILE).pdf *.bbl *.blg *.cb *.cb2 *.lof *.toc *.dvi *.log *.ind *.idx *.idx.original *.gdx *.gdx.original *.gnd *.ilg *.out *.probs *-saved *~

.PHONY: veryclean

veryclean: clean
	-rm -f *.aux *.pdf

.PHONY: showpolicy showsolutions staffsolutions hidesolutions \
              togglesolutions asksolutions \
              shownotes hidenotes togglenotes \
              showinbook showinhandout

showpolicy showsolutions staffsolutions hidesolutions \
              hideproblems showproblems toggleproblems \
              togglesolutions asksolutions\
              shownotes hidenotes togglenotes \
              showinbook showinhandout:
	$(MAKE) -C .. $@
