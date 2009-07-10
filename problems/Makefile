FORMAT = ../format -noinclude

%: %.pdf
	@

%.pdf: %.tex
	$(FORMAT) $*

.PRECIOUS: %.pdf

clean:
	-rm -f *.bbl *.blg *.toc *.dvi *.log *.ind *.idx *.ilg *.out *~

veryclean: clean
	-rm -f *.aux *.pdf
