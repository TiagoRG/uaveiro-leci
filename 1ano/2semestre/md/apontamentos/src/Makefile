.PHONY: all compile clean

all: compile clean

compile: main.tex
	pdflatex main.tex
	pdflatex main.tex
	mv main.pdf ../md-tiagorg.pdf

clean:
	rm -f *.aux *.blg *.bbl *.toc *.log *.lof *.lot *.log.xml *.bcf *.out *.run.xml *.gz
