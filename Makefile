#############################################################################

MF=$(filter-out feynmf.mf, $(wildcard *.mf))

LIST1=$(MF:.mf=.tfm)
LIST2=$(MF:.mf=.600pk)
LIST3=$(MF:.mf=.t1)
LIST4=$(MF:.mf=.2602gf)

#############################################################################

all:
	@for f in $(MF); do mf $$f; done;

	latex phd.tex
	dvips phd.dvi

#############################################################################

pdf:
#	@for f in $(MF); do mf $$f; done;

	pdflatex phd.tex

#############################################################################

opt:
	pdftops \
		-paper match \
		-nocrop \
		-noshrink \
		-nocenter \
		-q \
		phd.pdf phd.ps

	ps2pdf14 \
		-dEmbedAllFonts=true \
		-dUseFlateCompression=true \
		-dOptimize=true \
		-dProcessColorModel=/DeviceRGB \
		-dUseCIEColor=true \
		-r72 \
		-dDownsampleGrayImages=true \
		-dGrayImageResolution=72 \
		-dAutoFilterGrayImages=false \
		-dGrayImageDownsampleType=/Bicubic \
		-dDownsampleMonoImages=true \
		-dMonoImageResolution=72 \
		-dMonoImageDownsampleType=/Bicubic \
		-dDownsampleColorImages=true \
		-dColorImageResolution=72 \
		-dAutoFilterColorImages=false \
		-dColorImageDownsampleType=/Bicubic \
		-dPDFSETTINGS=/prepress \
		phd.ps phd_opt.pdf

#############################################################################

clean:
	rm -fr *.pdf *.ps *.dvi *.aux *.log *.toc $(MF) $(LIST1) $(LIST2) $(LIST3) $(LIST4)

#############################################################################

commit:
	@git commit -a -m="just a commit" ; git push

#############################################################################

