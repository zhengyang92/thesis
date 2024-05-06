PAPER = main
TEX = $(wildcard *.tex)
BIB = main.bib
FIGS = $(wildcard figures/*.pdf figures/spec/*.pdf)
DRAWIO_SRCS = $(wildcard figures/*.drawio)
DRAWIO_PDFS = $(DRAWIO_SRCS:.drawio=.pdf)

UNAME := $(shell uname)
ifeq ($(UNAME),Darwin)
  DRAWIO=draw.io
else
  DRAWIO=drawio
endif

.PHONY: all clean

all: $(PAPER).pdf

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) $(DRAWIO_PDFS)
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

watch:
	latexmk -pdf main.tex -pvc

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdflatex $(PAPER).pdf
	rm -f $(DRAWIO_PDFS)
	rm -f *.fls *.fdb_latexmk *.synctex.gz *.lof *.lot *.toc

figures/%.pdf : figures/%.drawio
	$(DRAWIO) -x -f pdf -o $@ $<
	pdfcrop $@ $@
