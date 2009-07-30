FORMAT = bin/format

export DRIVER_FILE = mcs

book: $(DRIVER_FILE)

%: %.pdf
	@

%.pdf: %.tex FORCE
	$(FORMAT) $*

FORCE: 

.PRECIOUS: %.pdf

clean:
	-rm -f $(DRIVER_FILE).pdf *.bbl *.blg *.toc *.dvi *.log *.ind *.idx *.ilg *.out *~

cleanall: clean
	(cd problems; make clean)

veryclean: clean
	-rm -f *.aux *.pdf

verycleanall: veryclean
	(cd problems; make veryclean)




