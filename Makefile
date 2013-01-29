all: Template.pdf masterthesis.pdf

Template.pdf: Template.dvi
	dvipdfmx Template.dvi

Template.dvi: Template.tex masterthesis.sty
	platex -kanji=utf8 -interaction=nonstopmode Template.tex

masterthesis.pdf: masterthesis.dvi
	dvipdfmx masterthesis.dvi

masterthesis.dvi: masterthesis.sty masterthesis.dtx
	platex -kanji=utf8 -interaction=nonstopmode masterthesis.dtx

masterthesis.sty: masterthesis.dtx masterthesis.ins
	platex -kanji=utf8 -interaction=nonstopmode masterthesis.ins

clean:
	rm -f masterthesis.sty *.pdf *.dvi *.aux *.log *.toc
