VERSION=0.12

LATEX=pdflatex
#$(LATEX)=$(LATEX)

DOC=myproposal

all: planning.R myproposal.tex
	make planning.pdf
	latexmk -pdf -bibtex myproposal

planning.pdf: planning.R
	R --no-save < planning.R

clean:
	rm -rf *.aux **.bbl *.blg *.lof *.lot *.dvi *.toc *.out *.log

LIB=thesis_proposal.cls thesis_proposal.bst thesis_proposalbib.sty Makefile README.md

EXAMPLE=$(DOC).tex $(DOC)_expected.pdf literature.bib planning.R planning.pdf

LOGO=logo-eagle.jpg logo-eagle.eps logo-eagle.pdf
FILES=$(LIB) $(EXAMPLE) $(LOGO) NEWS

DIR=thesis_proposal_$(VERSION)

dist:
	make
	mv $(DOC).pdf $(DOC)_expected.pdf
	rm -rf $(DIR)
	mkdir $(DIR)
	cp $(FILES) $(DIR)
	rm -f $(DIR).zip
	zip -r $(DIR).zip $(DIR)
	rm -rf $(DIR)
