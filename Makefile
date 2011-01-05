MF=$(filter-out feynmf.mf, $(wildcard *.mf))

LIST1=$(MF:.mf=.tfm)
LIST2=$(MF:.mf=.600pk)
LIST3=$(MF:.mf=.t1)
LIST4=$(MF:.mf=.2602gf)

all:
	for f in $(MF); do mf $$f; done;

	latex phd.tex
	dvips phd.dvi

pdf:
	for f in $(MF); do mf $$f; done;

	pdflatex phd.tex

clean:
	rm -fr *.pdf *.ps *.dvi *.aux *.log $(MF) $(LIST1) $(LIST2) $(LIST3) $(LIST4)

commit:
	git commit -a -m=""

