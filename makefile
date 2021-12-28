PROJNAME := Python-Examples
DOC_SRC := main.tex
DOC_TARGET := $(PROJNAME).pdf
PROJ_DIR := $(shell pwd)

LATEXMK_OPTIONS := -pdf -halt-on-error -use-make -jobname=$(PROJNAME) -shell-escape

.PHONY: all clean cleanall 

all: $(DOC_TARGET)

$(DOC_TARGET): $(DOC_SRC) streamplot.pgf velocityplot.pgf
	time -v latexmk $(LATEXMK_OPTIONS) $<

cleanall:
	latexmk -C -jobname=%A $(PROJNAME).pdf
	rm -vf *~ *.out
clean:
	latexmk -c -jobname=%A $(PROJNAME).pdf
	rm -vf *~ *.out

streamplot.pgf : streamplot.py
	time -v python3 $<

velocityplot.pgf : velocityplot.py
	time -v python3 $<
