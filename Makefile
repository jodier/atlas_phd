MF=$(filter-out feynmf.mf, $(wildcard *.mf))

MF1=$(MF:.mf=.tfm)
MF2=$(MF:.mf=.600pk)

all:
	latex phd.tex

ps: all
	dvips phd.dvi &> /dev/null

pdf:
	pdflatex phd.tex

clean:
	rm -fr *.pdf *.ps *.dvi *.aux *.log $(MF) $(MF1) $(MF2)

