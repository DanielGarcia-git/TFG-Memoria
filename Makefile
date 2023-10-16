DOCUMENTO = main
TEMPORALES = *idx *aux *lof *log *lot *toc *bbl *blg *~ *out *rel *spl *loa *brf main.lomyequation main.locode
HOY=$(shell date +"%Y-%m-%d")

all: pdf 

dvi: ${DOCUMENTO}.tex
	latex ${DOCUMENTO}

ps: dvi
	dvips -o ${DOCUMENTO}.ps ${DOCUMENTO}.dvi

pdf: 
	pdflatex --shell-escape ${DOCUMENTO}
	pdflatex --shell-escape ${DOCUMENTO}
	bibtex ${DOCUMENTO}.aux
	pdflatex --shell-escape ${DOCUMENTO}
	bibtex ${DOCUMENTO}.aux
	pdflatex --shell-escape ${DOCUMENTO}

backup:
	tar -cvzf ${HOY}.tgz ${DOCUMENTO}.tex  ./figs/* 

clean:
	del -f $(TEMPORALES)

cleanall:
	del -f $(TEMPORALES) *pdf *dvi

release:
	tar -cvzf $(HOY).tgz *
