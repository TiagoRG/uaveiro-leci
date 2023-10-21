.PHONY: all compile clean

all: compile clean

compile: main.tex bibliography.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex
	mv main.pdf ../report.pdf

clean:
	rm -f *.aux *.blg *.bbl *.toc *.log *.lof *.lot *.log.xml *.bcf *.out *.run.xml *.gz
