TSLIDES = $(shell find . -maxdepth 1 -iname "slides-*.tex")
TPDFS = $(TSLIDES:%.tex=%.pdf)

all:
	@if [ -d "../../latex-math" ]; then\
		make texclean;\
		make $(TPDFS);\
		make copy;\
		make texclean;\
	else\
		echo "Cannot find 'latex-math' in root directory";\
	fi

$(TPDFS): %.pdf: %.tex
	@echo render $<;
	@latexmk -pdf $<;

copy:
	cp *.pdf ../../slides-pdf

texclean:
	rm -rf *.out
	rm -rf *.dvi
	rm -rf *.log
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.blg
	rm -rf *.ind
	rm -rf *.idx
	rm -rf *.ilg
	rm -rf *.lof
	rm -rf *.lot
	rm -rf *.toc
	rm -rf *.nav
	rm -rf *.snm
	rm -rf *.vrb
	rm -rf *.fls
	rm -rf *.fdb_latexmk
	rm -rf *.synctex.gz
	rm -rf *-concordance.tex

