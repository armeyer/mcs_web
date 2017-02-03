all: rec3.tex counter.eps unbounded.eps diagram.eps
	ps2pdf counter.eps
	ps2pdf diagram.eps
	ps2pdf unbounded.eps
	pdflatex rec3.tex

clean:
	rm *~ *.dvi *.pdf *.ps *.out *.aux *.log