DOCUMENTO = main
TEMPORALES = *idx *aux *lof *log *lot *toc *bbl *blg *~ *out *rel *spl *loa *brf memoria.lomyequation memoria.locode
HOY=$(shell date +"%Y-%m-%d")

all: pdf 

dvi: ${DOCUMENTO}.tex
	latex ${DOCUMENTO}

ps: dvi
	dvips -o ${DOCUMENTO}.ps ${DOCUMENTO}.dvi

pdf: 
	pdflatex ${DOCUMENTO}
	pdflatex ${DOCUMENTO}
	bibtex ${DOCUMENTO}.aux
	pdflatex ${DOCUMENTO}
	bibtex ${DOCUMENTO}.aux
	pdflatex ${DOCUMENTO}
	del -f $(TEMPORALES) *dvi

backup:
	tar -cvzf ${HOY}.tgz ${DOCUMENTO}.tex  ./figs/* 

clean:
	del -f $(TEMPORALES)

cleanall:
	del -f $(TEMPORALES) *pdf *dvi

release:
	tar -cvzf $(HOY).tgz *
